require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'
require './lib/market'

class Test < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor3.stock(@item1, 65)
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_attributes
    assert_equal "South Pearl Street Farmers Market", @market.name
    assert_equal [], @market.vendors
  end

  def test_market_can_add_vendors
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal [@vendor1, @vendor2, @vendor3], @market.vendors
  end

  def test_market_can_get_vendor_names
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
    assert_equal ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"], @market.vendor_names
  end
end
# pry(main)> market.vendor_names
# #=> ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
#
# pry(main)> market.vendors_that_sell(item1)
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]
#
# pry(main)> market.vendors_that_sell(item4)
# #=> [#<Vendor:0x00007fe1349bed40...>]
#
# pry(main)> vendor1.potential_revenue
# #=> 29.75
#
# pry(main)> vendor2.potential_revenue
# #=> 345.00
#
# pry(main)> vendor3.potential_revenue
# #=> 48.75
# ```
# A Vendor will be able to calculate their `potential_revenue` - the sum of all their items' price * quantity.
#
# A Market is responsible for keeping track of Vendors. It should have a method called `vendor_names` that returns an array of all the Vendor's names.
#
# Additionally, the Market should have a method called `vendors_that_sell` that takes an argument of an item represented as a String. It will return a list of Vendors that have that item in stock.
#
# Use TDD to create a `Market` class that responds to the following interaction pattern:
#
