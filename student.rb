# student.rb
require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom:, age:, name: 'Unknown', parent_permission: true)
    super(id, age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
