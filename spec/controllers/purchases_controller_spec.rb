require 'spec_helper'

describe PurchasesController do
    
  describe 'Post #create' do
    
    context 'with params[:file]' do
    
      valid_file = File.new("#{Rails.root}/spec/factories/valid.tab")
      invalid_file = File.new("#{Rails.root}/spec/factories/invalid.tab")
            

  	  it "Create a new Purchase with a correct gross revenue calculated"  do
  	    processed_file = Rack::Test::UploadedFile.new(valid_file)
        
        post :create, file: processed_file
  	  
  		  expect(Purchase.first.gross_revenue).to eq 90.0

  	  end
  	  
  	   it " adds two new inventories"  do
    	    processed_file = Rack::Test::UploadedFile.new(valid_file)
          expect{
          post :create, file: processed_file

        }.to change(Inventory, :count).by(2)

    	  end
    	  
    	  
  	  
  	  it " Doesn't add a new Purchase"  do
  	    processed_file = Rack::Test::UploadedFile.new(invalid_file)
        
        expect{
        post :create, file: processed_file
  	  
  		  }.to_not change(Purchase, :count)
  		    		  

  	  end
  	  
  	  
  	  it " Doesn't add a new Inventory"  do
  	    processed_file = Rack::Test::UploadedFile.new(invalid_file)
        
        expect{
        post :create, file: processed_file
  	  
  		  }.to_not change(Inventory, :count)
  		    		  

  	  end
  	  
  	  
  
    end	
  	
  end

end