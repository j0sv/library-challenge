require './lib/library.rb'

class Interface

  def initialize()
    @lib = Library.new
    @exit_app=false
    application_loop
  end

  def print_main_menu()
    clear
    puts 'Enter option by providing text within [] to make selection.'
    puts '[1]. List All Books'
    puts '[2]. List Available Books'

    if @lib.currentUser != nil
      print_user_menu()
    end

    if true # @lib.currentUser != nil || @lib.currentUser.is_librarian?
      print_librarian_menu()
    end

    puts '[L]. Logon Application'
    puts '[Q]. Exit Application'
  end

  def print_user_menu()
    puts "user"
  end

  def print_librarian_menu()
    puts '---== Librarian Menu ==---'
    puts '[L1]. List Unavailable Books'
    puts '[L2]. List Late Return Books'
  end

  def application_loop
    while @exit_app==false

      print_main_menu

      menu_input = gets.chomp
      menu_input=menu_input.to_s
      menu_input=menu_input.downcase

      application_action(menu_input)

    end
  end

  def application_action(selection)

    puts 'inside application_action'

    case selection
    when '1', 'list'
      clear
      @lib.list_books("all")
      continue
    when '2'
      clear
      @lib.list_books("available")
      continue
    when 'L'
      puts 'val L'
    when 'q'
      @exit_app=true
    else
      puts "Incorrect selection!"
    end
  end

  def clear
    system "clear"
  end

  def continue
    print "Press [Enter] key to continue\r"
    gets
  end

end



instance = Interface.new
