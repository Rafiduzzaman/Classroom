require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts "List of Books:"
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts "List of People:"
    people.each do |person|
      if person.is_a?(Student)
        puts "Student: Name - #{person.name}, Classroom - #{person.classroom.label}"
      elsif person.is_a?(Teacher)
        puts "Teacher: Name - #{person.name}, Specialization - #{person.specialization}"
      end
    end
  end

  def create_person(type, name, options = {})
    if type == "student"
      classroom = options[:classroom]
      age = options[:age] || 18
      parent_permission = options[:parent_permission] || true
      student = Student.new(classroom, age, name, parent_permission)
      people << student
    elsif type == "teacher"
      specialization = options[:specialization]
      age = options[:age] || 18
      parent_permission = options[:parent_permission] || true
      teacher = Teacher.new(specialization, age, name, parent_permission)
      people << teacher
    end
    puts "Created #{type.capitalize}: Name - #{name}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    books << book
    puts "Created Book: Title - #{title}, Author - #{author}"
  end

  def create_rental(person_id, book_id, date)
    person = people[person_id]
    book = books[book_id]
    rental = Rental.new(book, person, date)
    rentals << rental
    puts "Rental created for #{person.name} - #{book.title} on #{date}"
  end

  def list_rentals(person_id)
    person = people[person_id]
    puts "Rentals for #{person.name}:"
    rentals_for_person = rentals.select { |r| r.person == person }
    rentals_for_person.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end

  def start
    puts "Welcome to the Library Management System"
    loop do
      puts "\nOptions:"
      puts "1. List all books"
      puts "2. List all people"
      puts "3. Create a person"
      puts "4. Create a book"
      puts "5. Create a rental"
      puts "6. List rentals for a person"
      puts "7. Quit"
      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        list_books
      when 2
        list_people
      when 3
        print "Enter person type (student or teacher): "
        type = gets.chomp.downcase
        print "Enter person name: "
        name = gets.chomp
        if type == "student"
          print "Enter classroom label: "
          classroom = gets.chomp
          create_person(type, name, classroom: classroom)
        elsif type == "teacher"
          print "Enter specialization: "
          specialization = gets.chomp
          create_person(type, name, specialization: specialization)
        else
          puts "Invalid person type."
        end
      when 4
        print "Enter book title: "
        title = gets.chomp
        print "Enter book author: "
        author = gets.chomp
        create_book(title, author)
      when 5
        print "Enter person ID: "
        person_id = gets.chomp.to_i
        print "Enter book ID: "
        book_id = gets.chomp.to_i
        print "Enter rental date: "
        date = gets.chomp
        create_rental(person_id, book_id, date)
      when 6
        print "Enter person ID: "
        person_id = gets.chomp.to_i
        list_rentals(person_id)
      when 7
        break
      else
        puts "Invalid option."
      end
    end
  end
end

app = App.new
app.start
