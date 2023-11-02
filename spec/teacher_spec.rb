require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 35, name: 'Alice') }

  it 'should have a specialization' do
    expect(teacher.specialization).to eq('Math')
  end

  it 'should have a name' do
    expect(teacher.name).to eq('Alice')
  end

  it 'should have an age' do
    expect(teacher.age).to eq(35)
  end

  it 'should be able to use services' do
    expect(teacher.can_use_services?).to be true
  end
end
