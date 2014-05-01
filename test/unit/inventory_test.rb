require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Inventory.new.valid?
  end
end
