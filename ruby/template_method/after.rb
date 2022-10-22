class SelfIntroduction
  def initialize(person)
    @person = person
  end

  def perform
    greeting
    tell_name
    tell_hobby
    tell_dream
  end

  def greeting
  end

  def tell_name
  end

  def tell_hobby
  end

  def tell_dream
  end
end

class SelfIntroductionForJapanese < SelfIntroduction
  def greeting
    puts "こんにちは"
  end

  def tell_name
    puts "私の名前は#{@person.name}です"
  end

  def tell_hobby
    puts "趣味は#{@person.hobby}です"
  end
end

class SelfIntroductionForAmerican < SelfIntroduction
  def greeting
    puts "Hi"
  end

  def tell_name
    puts "My name is #{@person.name}"
  end

  def tell_dream
    puts "My dreem is to become a #{@person.dream}"
  end
end

class Person
  def initialize(nationality, name, hobby, dream)
    @nationality = nationality
    @name = name
    @hobby = hobby
    @dream = dream
  end

  attr_reader :nationality, :name, :hobby, :dream
end

japanese = Person.new("Japan", "寛人", "野球", "エンジニア")

american = Person.new("America", "Mike", "baseball", "baseball player")


SelfIntroductionForJapanese.new(japanese).perform

SelfIntroductionForAmerican.new(american).perform