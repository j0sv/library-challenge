require 'yaml'

class Library
  attr_accessor :books, :name

  def initialize(args={})
    @name = 'The Lib of CA'
    @books = get_books
  end

  def list_books(available=nil)
    puts "List of all books at #{name}: "
    @books.each do |book|
      puts "-----------------------------------------------"
      puts "Title: #{book[:item][:title]}"
      puts "Author: #{book[:item][:author]}"
      if book[:available] == false
        puts "Available: #{book[:available]}, return date: #{book[:return_date]}"
      else
        puts "Available: #{book[:available]}"
      end
    end
    puts "-----------------------------------------------"
  end

  def get_books()
    YAML.load_file('./lib/books_data.yml')
  end

end
