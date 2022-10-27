class Child
  def initialize(age, mother, grand_father, grand_mother)
    @age = age
    @mother = mother
    @grand_father = grand_father
    @grand_mother = grand_mother
  end

  attr_accessor :age

  def happy_birthday(age)
    @age = age

    @mother.give_present
    @grand_mother.give_present
    @grand_father.give_present
  end
end

class Mother
  def give_present
    p 'トランプを買ってあげる！'
  end
end

class GrandMother
  def give_present
    p 'PS5を買ってあげる'
  end
end

class GrandFather
  def give_present
    p '車を買ってあげる'
  end
end

hiroto = Child.new(3, Mother.new, GrandFather.new, GrandMother.new)

hiroto.happy_birthday(4)

#親戚が増えると、Childも修正しないといけない