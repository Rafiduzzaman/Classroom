class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    return if students.include?(student)

    students.push(student)
    student.classroom = self # Set the classroom attribute of the student
  end
end
