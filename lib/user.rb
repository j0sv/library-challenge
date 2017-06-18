class User
  attr_accessor :userid, :books

  def initialize
    @userid='josv'
    @books = get_books
  end

  #Add a book to the list of borrobved books
  def add_book (bookid)
    @books.push({:bookid=>bookid, :userid=>@userid, :returned=>false})
    File.open('./lib/books_user_data.yml', 'w') { |f| f.write @books.to_yaml }
  end

  #Get all books that the users have borrowed
  def get_books()
    YAML.load_file('./lib/books_user_data.yml')
  end

  def list_books
    @books.each_char { |book| puts book }
  end

  def list_borrowed_books
    puts @books.select { |obj| obj[:userid] == @userid}
  end

end
