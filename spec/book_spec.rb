require 'rspec'
require_relative '../book' # Adjust the path as needed
require_relative '../person' # Adjust the path as needed
require 'date'
require 'json'
describe Book do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(25, 'John', parent_permission: true) }

  it 'can rent a book' do
    rental = book.rent(person, Date.today)
    expect(rental).to be_a(Rental)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end

  it 'correctly converts to JSON' do
    json_data = book.to_json
    expect(json_data).to be_a(String)
    expect(JSON.parse(json_data)).to eq({ 'title' => 'Title', 'author' => 'Author' })
  end
end
