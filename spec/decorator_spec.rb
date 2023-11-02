require 'rspec'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('nameable', correct_name: 'test name') }
  let(:decorator) { Decorator.new(nameable) }

  it 'delegates to nameable' do
    expect(decorator.correct_name).to eq('test name')
  end
end
