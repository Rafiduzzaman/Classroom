require 'rspec'
require_relative '../student'

describe Student do
  let(:student) { Student.new('Classroom 101', 16, 'John Doe') }

  it 'should have a classroom' do
    expect(student.classroom).to eq('Classroom 101')
  end

  it 'should have a name' do
    expect(student.name).to eq('John Doe')
  end

  it 'should have an age' do
    expect(student.age).to eq(16)
  end

  it 'should play hooky' do
    expect(student.play_hooky).to eq('¯\\(ツ)/¯')
  end
end
