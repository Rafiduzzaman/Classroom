class UserInterface
  def initialize(app)
    @app = app
    @options = {
      '1' => :books_list,
      '2' => :people_list,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :show_rental,
      '7' => :exit_application
    }
  end

  def start
    puts 'Welcome to Our School Library App!'
    loop do
      puts "\nPlease choose an option by entering a number:"
      display_menu
      option = gets.chomp
      handle_option(option)
    end
  end

  private

  def display_menu
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n"
  end
end
