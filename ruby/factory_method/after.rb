#完全コンストラクタ + 値オブジェクト
class ShippingFeeForTokyo
  def initialize(fee)
    @fee = fee
  end

  def shipping_fee
    @fee * 1.0
  end
end

class ShippingFeeForOkinawa
  def initialize(fee)
    @fee = fee
  end

  def shipping_fee
    @fee * 2.0
  end
end

# class ShippingFee
#   def decide_shipping_fee(prefecture, fee)
#     case prefecture
#     when '東京'
#       ShippingFeeForTokyo.new(fee).shipping_fee
#     when '沖縄'
#       ShippingFeeForOkinawa.new(fee).shipping_fee
#     end
#   end
# end

#↑各ロジックを複数クラスに分割するのに成功


class ShippingFeeFactory
  def self.for(prefecture, fee)
    case prefecture
    when '東京'
      ShippingFeeForTokyo.new(fee)
    when '沖縄'
      ShippingFeeForOkinawa.new(fee)
    end
  end
end

#ファクトリーメソッド定義
#対応する都道府県の定義をShippingFeeFactory内に閉じ込められた
#↓おかげでdecide_shipping_feeがwhenで膨れ上がることを防げた

class ShippingFee
  def initialize(fee, prefecture)
    @fee = fee
    @prefecture = prefecture
  end

  #ポリモーフィズム
  def decide_shipping_fee
    ShippingFeeFactory.for(@prefecture, @fee).shipping_fee
  end
end


p ShippingFee.new(700, '東京').decide_shipping_fee
