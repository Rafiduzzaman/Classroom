require 'rspec'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable', correct_name: 'john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  it 'capitalizes the correct_name' do
    expect(decorator.correct_name).to eq('John doe')
  end
end
