class OldPrinter
  def initialize(name)
    @name = name
  end

  def old_printer
    puts "#{@name} is old printer"
  end
end

class NextPrinter
  def initialize(name)
    @name = name
  end

  def print
    puts "#{@name} is next generation printer"
  end
end


class PrinterClient
  def use_printer(printer)
    printer.print
  end
end


PrinterClient.new.use_printer(NextPrinter.new('NextPrinter'))

#printメソッドを使うためのアダプターを作成

class PirnterAdaptor
  def initialize(printer)
    @printer = printer
  end

  def print
    @printer.old_printer
  end
end

#どのプリンターを使うかの選択はstorategyパターンと同じ
printer = PirnterAdaptor.new(OldPrinter.new('OldPrinter'))

PrinterClient.new.use_printer(printer)
