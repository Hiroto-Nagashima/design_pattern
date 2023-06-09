class InventoryManager
  def check_stock(item)
    puts "#{item} is in stock"
  end
end

class PricingManager
  def calculate_price(item, quantity)
    puts "The total for #{quantity} #{item}(s) is #{quantity * 10} dollars"
  end
end

class ShippingManager
  def ship_item(item, address)
    puts "Shipping #{item} to #{address}"
  end
end

# Facade
# 他クラスに処理を委譲して、一連の処理を実現
class OnlineShoppingFacade
  def initialize
    @inventory_manager = InventoryManager.new
    @pricing_manager = PricingManager.new
    @shipping_manager = ShippingManager.new
  end

  def purchase_item(item, quantity, address)
    @inventory_manager.check_stock(item)
    @pricing_manager.calculate_price(item, quantity)
    @shipping_manager.ship_item(item, address)
  end
end


def client_code(online_shopping_facade)
  online_shopping_facade.purchase_item("Book", 2, "123 Main St, Anytown, USA")
end


facade = OnlineShoppingFacade.new
client_code(facade)
