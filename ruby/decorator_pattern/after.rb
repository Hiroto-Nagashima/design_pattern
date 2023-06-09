class IceCream
  def initialize(topping)
    @topping = topping
  end

  def serve
    p "お待たせしました、トッピングは#{@topping.new_name}でございます"
  end
end

class Topping
  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def new_name
    @name
  end

  def new_price
    @price
  end
end

class ToppingDecorator < Topping
  def initialize(topping, name:, price:)
    super(name: name, price: price)
    @topping = topping
  end

  def new_name
    @name + @topping.new_name
  end

  def new_price
    @price + @topping.new_price
  end
end

class Chocolate < ToppingDecorator
  def initialize(topping, name: "チョコレート", price: 100)
    super
  end
end

class Biscuit < ToppingDecorator
  def initialize(topping, name: "ビスケット", price: 200)
    super
  end
end


IceCream.new(Chocolate.new(Biscuit.new(Topping.new(name: "トッピング", price: 400)))).serve
