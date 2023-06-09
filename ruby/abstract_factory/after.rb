# 椅子と机みたいなセットになるオブジェクトを作る
class AbstractFactory

  def create_chair
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_table
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


class ModernFactory < AbstractFactory
  def create_chair
    ModernChair.new
  end

  def create_table
    ModernTable.new
  end
end


class VictorianFactory < AbstractFactory
  def create_chair
    VictorianChair.new
  end

  def create_table
    VictorianTable.new
  end
end

class Chair
  def sit_on
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Table
  def put_on
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


class ModernChair < Chair
  def sit_on
    p "ModernChairで座る"
  end
end

class VictorianChair < Chair
  def sit_on
    p "VictorianChairで座る"
  end
end

class ModernTable < Table
  def put_on
    p "ModernTableに置く"
  end
end

class VictorianTable < Table
  def put_on
    p "VictorianTableに置く"
  end
end


class Client
  # initializeでfactoryを注入することでsit_onとput_onには同じfactoryが使われる
  # つまり別の種類の椅子と机が混じらない

  def initialize(factory)
    @factory = factory
  end

  def sit_on
    @factory.create_chair.sit_on
  end

  def put_on
    @factory.create_table.put_on
  end
end

# Clientは抽象に依存している。
# 具象クラスであるModernFactoryやVictorianFactoryの変更によってClientは影響を受けない。
Client.new(ModernFactory.new).sit_on
Client.new(ModernFactory.new).put_on
Client.new(VictorianFactory.new).sit_on
Client.new(VictorianFactory.new).put_on