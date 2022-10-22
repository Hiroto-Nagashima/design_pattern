class SelfIntroduction
  def initialize(person)
    @person = person
  end

  def perform
    if @person.nationality == "Japan"
      puts "こんにちは"
      puts "私の名前は#{@person.name}です"
      puts "趣味は#{@person.hobby}です"
    elsif @person.nationality == "America"
      puts "Hi"
      puts "My name is #{@person.name}"
      puts "My dreem is to become a #{@person.dream}"
    end
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

person = Person.new("Japan", "寛人", "野球", "エンジニア")

SelfIntroduction.new(person).perform

