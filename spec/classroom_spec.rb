require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new('Math', 16, 'John Doe') } # Create a real Student object

  it 'can add a student' do
    classroom.add_student(student)
    expect(classroom.students).to include(student)
  end

  it 'does not add the same student multiple times' do
    classroom.add_student(student)
    classroom.add_student(student) # Add the same student again
    expect(classroom.students.count).to eq(1)
  end
end
