require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create a person
# person = Person.new(age: 20, name: 'Alice', parent_permission: true)
person = Person.new(28, parent_permission: false)
p person.name
puts person.can_use_services?

# Create a student
student = Student.new('Math Class', 17, name: 'Bob', parent_permission: false)
puts student.can_use_services?
puts student.play_hooky

# Create a teacher
teacher = Teacher.new('Mathematics', 30, name: 'Mr. Smith', parent_permission: true)
puts teacher.can_use_services?
