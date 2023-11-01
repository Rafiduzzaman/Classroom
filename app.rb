require 'json'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def books_list
    if @books.empty?
      puts 'Books list is empty try add a book!'
    else
      @books.each_with_index do |book, index|
        puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def people_list
    if @people.empty?
      puts 'People list is empty try add a people!'
    else
      @people.each do |person|
        puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def show_people
    @people.each_with_index do |person, index|
      if person.nil?
        puts "Person at index #{index} is nil."
      else
        puts "(#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def show_rental
    puts 'Select person'
    show_people
    print 'Enter selected person ID: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rental.each do |rent|
      puts " Date: #{rent.date} Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
    end
  end

  def save_books_to_json
    File.write('books.json', JSON.generate(@books.map(&:to_json)))
  end

  def load_books_from_json
    if File.exist?('books.json')
      File.open('books.json', 'r') do |file|
        @books = JSON.parse(file.read).map { |book_data| Book.from_json(book_data) }
      end
    else
      puts 'Books file is missing or empty.'
    end
  end

  def save_people_to_json
    File.write('people.json', JSON.generate(@people.map(&:to_json)))
  end

  def load_people_from_json
    if File.exist?('people.json')
      File.open('people.json', 'r') do |file|
        @people = JSON.parse(file.read).map do |person_data|
          case person_data['type']
          when 'Student'
            Student.from_json(person_data['data'])
          when 'Teacher'
            Teacher.from_json(person_data['data'])
          end
        end
      end
    else
      puts 'People file is missing or empty.'
    end
  end

  def save_rentals_to_json
    File.write('rentals.json', JSON.generate(@rental.map { |r| r.to_json(@people, @books) }))
  end

  def load_rentals_from_json
    if File.exist?('rentals.json')
      File.open('rentals.json', 'r') do |file|
        rental_data = JSON.parse(file.read)
        @rental = rental_data.map { |data| Rental.from_json(data, @people, @books) }
      end
    else
      puts 'Rentals file is missing or empty.'
    end
  end

  def create_person(type)
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp

    if type == '1'
      print 'Parent permission [y/n]:'
      permission = gets.chomp
      print 'Enter classroom: '
      classroom = gets.chomp
      student = Student.new(classroom, age, name, parent_permission: permission)
      @people.push(student)
    elsif type == '2'
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name: name)
      @people.push(teacher)
    else
      puts 'Invalid input'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def create_rental
    if @books.empty?
      puts 'Book list is empty please first create a book!'
    else
      puts 'Select a book from the following lists by number'
      books_list
      print '\nEnter book number: '
      book_id = gets.chomp.to_i

      puts 'Select a person from the following lists by number (not id)'
      show_people
      print '\nEnter person number: '
      person_id = gets.chomp.to_i

      print '\nDate: '
      date = gets.chomp

      rent = Rental.new(date, @people[person_id], @books[book_id])
      @rental.push(rent)
      puts 'Rental created successfully!'
    end
  end
end
