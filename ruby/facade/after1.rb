class Book
  def search
    raise NotImplementedError
  end

  def lend
    raise NotImplementedError
  end
end


class Magazine < Book
  def search
    p "雑誌を検索する"
  end

  def lend
    p "雑誌を貸す"
  end
end

class Comic < Book
  def search
    p "漫画を検索する"
  end

  def lend
    p "漫画を貸す"
  end
end

# 具体的な処理を他のクラスに委譲する窓口となるクラス
class BookSearchFacade
  def initialize(magazine, comic)
    @magazine = magazine || Magazine.new
    @comic = comic || Comic.new
  end
  
  #複数クラスが協調して一連の処理を行う
  def search
    results = []
    results << @magazine.search
    results << @comic.search
    results << @magazine.lend
    results << @comic.lend
    results.join("\n")
  end
end

BookSearchFacade.new(Magazine.new, Comic.new).search