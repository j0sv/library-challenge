class User
  attr_accessor :userid, :books

  def initialize
    @userid='josv'
    @books = get_books
  end

  #Add a book to the list of borrowed books
  def add_book(bookid)
    if @books.any? { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == false }
      puts "The book alredy exists. Only new books can be added."
    elsif @books.any? { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == true }
      tmp_book=@books.detect { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == true }
      tmp_book[:returned]=false
      tmp_book[:returned_date]=nil
      File.open('./lib/books_user_data.yml', 'w') { |f| f.write @books.to_yaml }
    else
      puts @books.push({ :bookid=>bookid, :userid=>@userid, :returned=>false , :returned_date=>nil })
      File.open('./lib/books_user_data.yml', 'w') { |f| f.write @books.to_yaml }
    end
  end

  def return_book(bookid)
    if @books.any? { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == false}
      tmp_book=@books.detect { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == false }
      tmp_book[:returned]=true
      tmp_book[:returned_date]=Time.now
      File.open('./lib/books_user_data.yml', 'w') { |f| f.write @books.to_yaml }
    elsif @books.any? { |obj| obj[:bookid] == bookid && obj[:userid] == @userid && obj[:returned] == true}
      puts "The book has alredy been returned."
    else
      puts "The book has not been borrowed. Only borrowed books can be returned."
#      File.open('./lib/books_user_data.yml', 'w') { |f| f.write @books.to_yaml }
    end
    tmp_book
  end

  #Get all books that the users have borrowed
  def get_books()
    YAML.load_file('./lib/books_user_data.yml')
  end

  def list_borrowed_books
    tmp_books = @books.select { |obj| obj[:userid] == @userid && obj[:returned] == false}
    tmp_books.uniq!
    puts "Books borrowed by #{@userid}: "
    puts "-----------------------------------------------"
    tmp_books.each do |book|
      print_borrowed_books(book[:bookid])
    end
    #Prints Hash if not nil is returned 
    return nil
  end

  def print_borrowed_books(bookid)
    tmp_books = YAML.load_file('./lib/books_data.yml')
    tmp_books = tmp_books.select { |obj| obj[:item][:bookid] == bookid }

    tmp_books.each do |book|
      puts "Title: #{book[:item][:title]}"
      puts "Author: #{book[:item][:author]}"
      puts "Return date: #{book[:return_date]}"
      puts "-----------------------------------------------"
    end

  end

end
