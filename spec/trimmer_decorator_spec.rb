require 'rspec'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable', correct_name: 'This is a long name that should be trimmed') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  it 'trims the correct_name to 10 characters' do
    expect(decorator.correct_name).to eq('This is a ...')
  end
end
