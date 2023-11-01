require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_json(*_args)
    {
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name
    }.to_json
  end

  def self.from_json(json_string)
    data = JSON.parse(json_string)
    new(data['specialization'], data['age'], data['name'])
  end

  def can_use_services?
    true
  end
end
