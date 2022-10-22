#template methodと違って集約を使う
#元のオブジェクトは、 コンテキストと呼ばれ、 一つのストラテジー・オブジェクトへの参照を保持し、 それに振る舞いの実行を委任

class SelfIntroduction #コンテキスト
  def initialize(introduction)
    @introduction = introduction #ストラテジー・オブジェクト
  end

  def perform
    @introduction.perform
  end
end

class SelfIntroductionForJapanese
  def initialize(person)
    @person = person
  end

  def perform
    greeting
    tell_name
    tell_hobby
  end

  private

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

SelfIntroduction.new(SelfIntroductionForJapanese.new(japanese)).perform