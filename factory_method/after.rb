class BaseFactory

  def generate
    raise NotImplementedError
  end
end


class MailTemplateFactory < BaseFactory

  # ファクトリーメソッド
  def generate
    MailTemplate.new
  end
end


class LineTemplateFactory < BaseFactory

  def generate
    LineTemplate.new
  end
end

class Template
  def show
    raise NotImplementedError
  end
end


class LineTemplate < Template
  def show
    p "LINEテンプレート"
  end
end


class MailTemplate
  def show
    p "メールテンプレート"
  end
end

class MessageSender
  def initialize(template_factory)
    @template_factory = template_factory
  end

  def send_message
    template = @template_factory.generate
    template.show
  end
end

# newの引数にはMailTemplate．newというふうに直接クラスを指定する事もできる
# MailTemplateFactoryという抽象、インターフェースを噛ませることでMailTemplateが変更されたり、別のクラスに置き換わってもMessageSenderは影響を受けない
MessageSender.new(MailTemplateFactory.new).send_message
