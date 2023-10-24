require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create a person
person = Person.new(1, 20, "Alice", true)
puts person.can_use_services?

# Create a student
student = Student.new(2, 17, "Bob", false, "Math Class")
puts student.can_use_services?
puts student.play_hooky

# Create a teacher
teacher = Teacher.new(3, 30, "Mr. Smith", true, "Mathematics")
puts teacher.can_use_services?
