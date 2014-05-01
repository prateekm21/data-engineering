class Purchase < ActiveRecord::Base
  has_many :inventories
  attr_accessible :file_name, :gross_revenue
end
