require 'yaml'

class Library
  attr_accessor :books, :name

  def initialize(args={})
    @name = 'The Lib of CA'
  end

  def list_books
    puts "List of all books at #{name}: "
    get_books.each do |book|
      puts "------------------------------"
      puts "Title: #{book[:item][:title]}"
      puts "Author: #{book[:item][:author]}"
      puts "Available: #{book[:available]}"
      puts "Return date: #{book[:return_date]}"
    end
    puts "------------------------------"
  end


  private
  def get_books()
    @books = YAML.load_file('./lib/data.yml')
  end

end
