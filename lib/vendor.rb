class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    inventory.default = 0
    inventory[item]
  end

  def stock(item, amount)
    inventory[item] = 0 if inventory[item].nil?
    inventory[item] += amount
  end
end
