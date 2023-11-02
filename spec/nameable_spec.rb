require 'rspec'
require_relative '../nameable'

describe Nameable do
  let(:nameable) { Nameable.new }

  it 'raises NotImplementedError for correct_name' do
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
