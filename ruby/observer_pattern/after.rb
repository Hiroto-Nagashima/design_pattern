#変化するもの(子供)と変化に関心のあるもの（親と親戚）を分離する
#subject(変化するもの)　observer(変化に関心があるもの)
#結合度が下がり、凝集度が上がる


class Child
  def initialize(age)
    @age = age
    @observers = []
  end

  attr_accessor :age, :observers

  def add_observer(observer)
    @observers << observer
  end

  def delete_observers
    @observers.clear
  end

  def notify
    return unless age_valid?

    @observers.each do |observer|
      observer.give_present(self)
    end
  end

  def happy_birthday(age)
    @age = age

    p "みなさんこんにちは、今日で#{age}歳になりました。プレゼントをください"

    notify
  end

  private

  def age_valid?
    adult_age = 21

    if @age > adult_age
      p 'プレゼントをもらう年齢ではありません'

      false
    else
      true
    end
  end
end

#他クラスがageを持つオブジェクトに依存する
class Mother
  def give_present(child)
    p 'トランプを買ってあげる！' if child.age < 8
  end
end

class GrandMother
  def give_present(child)
    p 'PS5を買ってあげる' if child.age < 110
  end
end

class GrandFather
  def give_present(child)
    p '車を買ってあげる' if child.age < 60
  end
end

mother = Mother.new
grand_father = GrandFather.new
grand_mother = GrandMother.new
hiroto = Child.new(3)

hiroto.add_observer(mother)
hiroto.add_observer(grand_father)
hiroto.add_observer(grand_mother)

hiroto.happy_birthday(7)
