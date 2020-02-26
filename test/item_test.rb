require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
  end

  def test_it_exists
    assert_instance_of Item, @item1
  end

  def test_attributes
    assert_equal 'Peach', @item1.name
    assert_equal "$0.75", @item1.price
  end
end

# ```ruby
# pry(main)> require './lib/item'
# #=> true
#
# pry(main)> require './lib/vendor'
# #=> true
#
# pry(main)> item1 = Item.new({name: 'Peach', price: "$0.75"})
# #=> #<Item:0x007f9c56740d48...>
#
# pry(main)> item2 = Item.new({name: 'Tomato', price: '$0.50'})
# #=> #<Item:0x007f9c565c0ce8...>
#
# pry(main)> item2.name
# #=> "Tomato"
#
# pry(main)> item2.price
# #=> 0.50
#
# pry(main)> vendor = Vendor.new("Rocky Mountain Fresh")
# #=> #<Vendor:0x00007f85683152f0...>
#
# pry(main)> vendor.name
# #=> "Rocky Mountain Fresh"
#
# pry(main)> vendor.inventory
# #=> {}
#
# pry(main)> vendor.check_stock(item1)
# #=> 0
#
# pry(main)> vendor.stock(item1, 30)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# pry(main)> vendor.check_stock(item1)
# #=> 30
#
# pry(main)> vendor.stock(item1, 25)
#
# pry(main)> vendor.check_stock(item1)
# #=> 55
#
# pry(main)> vendor.stock(item2, 12)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
# ```
