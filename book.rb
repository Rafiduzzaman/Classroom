require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author
    }.to_json
  end

  def self.from_json(json_string)
    data = JSON.parse(json_string)
    new(data['title'], data['author'])
  end

  def rent(person, date)
    Rental.new(date, person, self)
  end
end
