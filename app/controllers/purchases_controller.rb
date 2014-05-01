class PurchasesController < ApplicationController
  # Only using three actions that are needed. 
  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end


  def show
    @purchase = Purchase.find(params[:id])
  end


  def create   
    
    @purchase = Purchase.new(file_name: params[:file].original_filename)

    # Using SmarterCSV in order to map the tab correctly to fields in case they are missing fields

    inventories = SmarterCSV.process(params[:file].path.to_s, {:col_sep => "\t", :row_sep => "\n"})

    @inventory_errors = validate_inventories(inventories)
    


    if  @inventory_errors.empty?

      revenue = 0.0
      inventories.each{|row|
        @inventory = Inventory.new(row)
        @inventory.purchase = @purchase
        revenue = revenue + (@inventory.item_price * @inventory.purchase_count)

        @inventory.save

      }

      @purchase.gross_revenue = revenue.to_f

      if @purchase.save

        respond_to do |format|
          format.html { redirect_to @purchase, :notice => "Successfully imported the file." }
        end
        
      end    

    else
  
      @purchase = Purchase.new
      
      redirect_to :action => :new , :inventory_errors => @inventory_errors 
      

    end
  end


  def validate_inventories(inventories)

    @inventory_errors = []

    inventories.each{|row|
      @inventory = Inventory.new(row)
      unless @inventory.valid?
        
        error_message = "<b>" << @inventory.purchaser_name << "</b> has these errors: <br> &nbsp;&nbsp;&nbsp;" 
        @inventory.errors.full_messages.each{|msg|
          error_message << msg << "<br>"                    
        }
                
        @inventory_errors << error_message           
      end
    }


    @inventory_errors
  end

end
