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

    if @lib.currentUser == nil
      puts '[L]. Logon Application'
    else
      puts '[L]. Logout Application'
    end
    puts '[Q]. Exit Application'
  end

  def print_user_menu()
    puts ''
    puts '---== User Menu ==---'
    puts '[U1]. List Youre Borrowed Books'
    puts ''
  end

  def print_librarian_menu()
    puts '' if @lib.currentUser == nil
    puts '---== Librarian Menu ==---'
    puts '[L1]. List Unavailable Books'
    puts '[L2]. List Late Return Books'
    puts ''
  end

  def application_loop
    while @exit_app==false

      print_main_menu
      print "Provide menu option: "
      menu_input = gets.chomp
      menu_input=menu_input.to_s
      menu_input=menu_input.downcase

      application_action(menu_input)

    end
  end

  def application_action(selection)

    case selection
    when '1', 'list'
      clear
      @lib.list_books("all")
      continue
    when '2'
      clear
      @lib.list_books("available")
      continue
    when 'l1'
      clear
      puts @lib.list_books("unavailable")
      continue
    when 'u1'
      if @lib.currentUser != nil
        clear
        puts @lib.currentUser.userid
        puts @lib.currentUser.list_borrowed_books
        continue
      end
    when 'l'
      clear
      puts @lib.logon_user
      puts "You have now logged on as the user #{@lib.currentUser.userid}" if @lib.currentUser != nil
      continue
    when 'q'
      @exit_app=true
      puts "Thank for the visit and welcome back to #{@lib.name}!"
    else
      clear
      puts selection + " is a invalid selection!"
      continue
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
