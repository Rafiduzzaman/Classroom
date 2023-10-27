# main.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, name: 'Maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

trimmed_person = TrimmerDecorator.new(person)
puts trimmed_person.correct_name
