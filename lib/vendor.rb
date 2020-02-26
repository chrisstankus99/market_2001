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

  def potential_revenue
    potential_revenue = 0
    inventory.each do |key, value|
      price = key.price.delete("$0").to_f
      potential_revenue += (price * value)
    end
    potential_revenue
  end
end
