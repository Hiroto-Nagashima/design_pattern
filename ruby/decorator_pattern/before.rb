class Animal
  def initialize(name:, cry:)
    @name = name
    @cry = cry
  end
end

class Dog < Animal
  def initialize(age, name:, cry:)
    @age = age
    super(name: name, cry: cry)
  end
end

p Dog.new(5, name: 'ぽち', cry: 'wan')
