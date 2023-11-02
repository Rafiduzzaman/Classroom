require 'rspec'
require_relative '../book' # Adjust the path as needed
require_relative '../person' # Adjust the path as needed
require_relative '../rental' # Adjust the path as needed
require 'date'
require 'json'

describe Person do
  let(:person) { Person.new(25, 'John', parent_permission: true) }
  let(:book) { Book.new('Title', 'Author') }

  it 'is of age if age is 18 or more' do
    expect(person.of_age?).to be(true)
  end

  it 'can use services with parent permission' do
    expect(person.can_use_services?).to be(true)
  end

  it 'correct name is the same as the provided name' do
    expect(person.correct_name).to eq('John')
  end

  it 'correctly converts to JSON' do
    json_data = person.to_json
    expect(json_data).to be_a(String)
    expect(JSON.parse(json_data)).to eq({
                                          'name' => 'John',
                                          'age' => 25,
                                          'parent_permission' => true
                                        })
  end
end
