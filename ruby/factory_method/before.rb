#値オブジェクト
class ShippingFee
  def decide_shipping_fee(prefecture, fee)
    if prefecture == '沖縄'
      fee * 2.0
    elsif prefecture == '東京'
      fee * 1.0
    end
  end
end

#問題点
###サポートしている都道府県を定義すると同時に、その都道府県に対する送料の計算をしている。つまり単一責任ではない
###いろんな県の送料計算ロジックを管理することになり、メソッドが膨れ上がる恐れあり