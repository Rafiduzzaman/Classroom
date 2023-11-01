require_relative 'app'

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts "\n1 - List all books"
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts "\n"
end

def handle_books_list(app)
  app.books_list
end

def handle_people_list(app)
  app.people_list
end

def handle_create_person(app)
  puts 'Choose the person type (1 for student, 2 for teacher):'
  person_type = gets.chomp
  app.create_person(person_type)
end

def handle_create_book(app)
  app.create_book
  app.save_books_to_json
end

def handle_create_rental(app)
  app.create_rental
  app.save_rentals_to_json
end

def handle_show_rental(app)
  app.show_rental
end

app = App.new

puts 'Welcome to Our School Library App!'
app.load_books_from_json
app.load_rentals_from_json

loop do
  display_menu
  option = gets.chomp

  case option
  when '1'
    handle_books_list(app)
  when '2'
    handle_people_list(app)
  when '3'
    handle_create_person(app)
  when '4'
    handle_create_book(app)
  when '5'
    handle_create_rental(app)
  when '6'
    handle_show_rental(app)
  when '7'
    puts 'Thanks for using this app!'
    break
  else
    puts 'Incorrect choice, please choose a number between 1 and 7'
  end
end
