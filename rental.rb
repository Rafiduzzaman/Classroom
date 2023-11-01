class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end

  class Rental
    attr_accessor :date, :person, :book

    def initialize(date, person, book)
      @date = date
      @person = person
      @book = book
      person.rentals << self
      book.rentals << self
    end

    def to_json(people, books)
      {
        'date' => @date,
        'person_index' => people.index(@person),
        'book_index' => books.index(@book)
      }
    end

    def self.from_json(data, people, books)
      date = data['date']
      person = people[data['person_index']]
      book = books[data['book_index']]

      new(date, person, book)
    end
  end

  def to_json(people, books)
    {
      'date' => @date,
      'person_index' => people.index(@person),
      'book_index' => books.index(@book)
    }
  end

  def self.from_json(data, people, books)
    date = data['date']
    person = people[data['person_index']]
    book = books[data['book_index']]

    new(date, person, book)
  end
end
