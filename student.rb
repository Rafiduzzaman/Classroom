require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_json(*_args)
    {
      'classroom' => @classroom,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json
  end

  def self.from_json(json_string)
    data = JSON.parse(json_string)
    new(data['classroom'], data['age'], data['name'], data['parent_permission'])
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
