require 'spec_helper'
 
describe Inventory do
  
  it "is valid with a valid item_price and purchase_count" do
    inventory = FactoryGirl.build(:inventory)
    expect(inventory).to be_valid
  end

  it "is invalid without a item_price " do
     inventory = FactoryGirl.build(:inventory, item_price: nil)
     expect(inventory).to have(1).errors_on(:item_price)
   end
   
   it "is invalid with an invalid number for item_price" do
      inventory = FactoryGirl.build(:inventory, item_price: 'invalid')
      expect(inventory).to have(1).errors_on(:item_price)
  end
  
  it "is invalid without a purchase_count" do
     inventory = FactoryGirl.build(:inventory, purchase_count: nil)
     expect(inventory).to have(1).errors_on(:purchase_count)
   end
   
   it "is invalid with non integer purchase_count" do
      inventory = FactoryGirl.build(:inventory, purchase_count: 2.5)
      expect(inventory).to have(1).errors_on(:purchase_count)
  end
    
     

end
