class ShippingFeePolicy
  def initialize(destination, total_number_of_items)
    @destination = destination
    @total_number_of_items = total_number_of_items
  end

  def deliver_to_japan_with_special_rate?
    to_japan? && over_item_num_limit?
  end

  def deliver_abroad_with_special_rate?
    to_abroad? && over_item_num_limit?
  end

  private

  def to_japan?
    @destination == 'Japan'
  end

  def to_abroad?
    @destination != 'Japan'
  end

  def over_item_num_limit?
    @total_number_of_items > 10
  end
end

class ShippingFee
  def initialize(destination, total_number_of_items)
    @destination = destination
    @total_number_of_items = total_number_of_items
    @basic_price = 100
  end

  def calculate_fee
    policy = ShippingFeePolicy.new(@destination, @total_number_of_items)

    @basic_price * 1.5 if policy.deliver_to_japan_with_special_rate?
    @basic_price * 2.0 if policy.deliver_abroad_with_special_rate?
    @basic_price * 1.0
  end
end


p ShippingFee.new("Japan", 11).calculate_fee