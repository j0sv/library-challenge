class User
  attr_accessor :userid, :books

  def initialize
    @userid='josv'
    @books = get_books
  end

  #Add a book to the list of borrobved books
  def add_book (book)
    tmp_books = YAML.load_file('./lib/books_user_data.yml')
    tmp_books.push({:bookid=>book[:item][:bookid], :userid=>@userid, :returned_date=>nil})
    File.open('./lib/books_user_data.yml', 'w') { |f| f.write collection.to_yaml }
  end

  #Get all books that the user has borrowed
  def get_books()
    tmp_books = YAML.load_file('./lib/books_user_data.yml')
    puts tmp_books[0]
    tmp_books.select { |obj| obj[:available] == @userid}
  end

end
