class IceCream
  def new_name
    'アイスクリーム'
  end

  def new_price
    400
  end
end

class IceCreamDecorator < IceCream
  def initialize(topping)
    @topping = topping
  end

  def new_name
    @topping.new_name
  end

  def new_price
    @topping.new_price
  end
end

class Chocolate < IceCreamDecorator
  def new_name
    'チョコレート' + @topping.new_name
  end

  def new_price
    100 + @topping.new_price
  end
end

class Biscuit < IceCreamDecorator
  def new_name
    'ビスケット' + @topping.new_name
  end

  def new_price
    300 + @topping.new_price
  end
end

p Chocolate.new(Biscuit.new(IceCream.new)).new_name
p Biscuit.new(Chocolate.new(IceCream.new)).new_name

#Chocolate is a Icecreamではないので適切な継承関係ではない気がする,,