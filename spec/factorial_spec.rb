require_relative '../solver'  # Make sure this path is correct

RSpec.describe Solver do
  describe '#factorial' do
    it 'returns 1 for 0' do
      solver = Solver.new
      expect(solver.factorial(0)).to eq(1)
    end

    it 'returns 1 for 1' do
      solver = Solver.new
      expect(solver.factorial(1)).to eq(1)
    end

    it 'returns the correct factorial for a positive integer' do
      solver = Solver.new
      expect(solver.factorial(5)).to eq(120)
    end

    it 'raises an exception for a negative integer' do
      solver = Solver.new
      expect { solver.factorial(-3) }.to raise_error(ArgumentError)
    end
  end
end
