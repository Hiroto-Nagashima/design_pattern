class ShippingFee
  def initialize(destination, total_number_of_items)
    @destination = destination
    @total_number_of_items = total_number_of_items
    @basic_price = 100
  end

  def calculate_fee
    if @destination == 'Japan' && @total_number_of_items > 10
      @basic_price * 1.5
    elsif @destination != 'Japan' || @total_number_of_items > 10
      @basic_price * 2
    else
      @basic_price * 1.0
    end
  end
end

p ShippingFee.new("Japan", 11).calculate_fee


