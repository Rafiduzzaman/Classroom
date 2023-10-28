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
      puts "(#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
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

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num = gets.chomp
    case num
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input'
    end
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Parent permission [y/n]:'
    permission = gets.chomp
    print 'Enter classroom: '
    classroom = gets.chomp
    student = Student.new(classroom, age, name, parent_permission: permission)
    @people.push(student)
    puts 'Person created successfully!'
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name, parent_permission: true)
    @people.push(teacher)
    puts 'Person created successfully!'
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
