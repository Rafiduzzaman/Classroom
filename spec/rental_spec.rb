require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  let(:person) { Person.new('John Doe', 30) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { '2023-11-02' }

  subject { Rental.new(rental_date, person, book) }

  it 'has a date' do
    expect(subject.date).to eq(rental_date)
  end

  it 'is associated with a person' do
    expect(subject.person).to eq(person)
  end

  it 'is associated with a book' do
    expect(subject.book).to eq(book)
  end

  it 'adds itself to the person and book rentals' do
    expect(person.rentals).to include(subject)
    expect(book.rentals).to include(subject)
  end

  it 'can be converted to JSON' do
    people = [person]
    books = [book]
    json_data = subject.to_json(people, books)

    expected_json = {
      'date' => rental_date,
      'person_index' => 0,
      'book_index' => 0
    }

    expect(json_data).to eq(expected_json)
  end

  it 'can be created from JSON data' do
    people = [person]
    books = [book]
    json_data = {
      'date' => rental_date,
      'person_index' => 0,
      'book_index' => 0
    }

    rental = Rental.from_json(json_data, people, books)

    expect(rental.date).to eq(rental_date)
    expect(rental.person).to eq(person)
    expect(rental.book).to eq(book)
  end
end
