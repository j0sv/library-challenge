require 'yaml'

class Library
  attr_accessor :books, :name

  def initialize(args={})
    @name = 'The Lib of CA'
    @books = get_books
  end

  def list_books(status='all')
    puts "List of all books at #{name}: "

    tmp_books = filter_books(status)

    tmp_books.each do |book|
      puts "-----------------------------------------------"
      puts "#{book[:item][:bookid]} Title: #{book[:item][:title]}"
      puts "Author: #{book[:item][:author]}"
      if book[:available] == false
        puts "Available: #{book[:available]}, return date: #{book[:return_date]}"
      else
        puts "Available: #{book[:available]}"
      end
    end
    puts "-----------------------------------------------"
  end

  def filter_books(status)
    case status
    when "available"
      tmp_books = @books.select { |obj| obj[:available] == true}
    when "unavailable"
      tmp_books = @books.select { |obj| obj[:available] == false}
    else
      tmp_books=@books
    end
    tmp_books
  end

  def get_books()
    YAML.load_file('./lib/books_data.yml')
  end

  def check_out_book(bookid)
    tmp_book = @books.detect { |obj| obj[:item][:bookid]==bookid }
    puts tmp_book
    tmp_book[:available] = false
    puts tmp_book
  end

end
