# person.rb
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age: 18, name: 'Unknown', parent_permission: true)
    @id = rand(1...1000) # Generate a random ID within the range 1-999
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
