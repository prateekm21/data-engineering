class Inventory < ActiveRecord::Base
  belongs_to :purchase
  attr_accessible :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name, :upload_id, :purchaser_name
  
  # Since the final inventory depends on item_price and purchase_count, we are validating them
  
  validates :item_price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0}
  
  
  validates_numericality_of :purchase_count, only_integer: true
  
end
