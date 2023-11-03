require_relative '../solver' # Make sure this path is correct

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

  describe '#reverse' do
    it 'returns the reversed word for a word' do
      solver = Solver.new
      expect(solver.reverse('hello')).to eq('olleh')
    end

    it 'returns an empty string for an empty string' do
      solver = Solver.new
      expect(solver.reverse('')).to eq('')
    end

    it 'returns the same character for a single character' do
      solver = Solver.new
      expect(solver.reverse('a')).to eq('a')
    end
  end

  describe '#fizzbuzz' do
    it 'returns "fizz" when N is divisible by 3' do
      expect(fizzbuzz(3)).to eq('fizz')
      expect(fizzbuzz(6)).to eq('fizz')
      expect(fizzbuzz(9)).to eq('fizz')
    end
  
    it 'returns "buzz" when N is divisible by 5' do
      expect(fizzbuzz(5)).to eq('buzz')
      expect(fizzbuzz(10)).to eq('buzz')
      expect(fizzbuzz(20)).to eq('buzz')
    end
  
    it 'returns "fizzbuzz" when N is divisible by both 3 and 5' do
      expect(fizzbuzz(15)).to eq('fizzbuzz')
      expect(fizzbuzz(30)).to eq('fizzbuzz')
    end
  
    it 'returns N as a string for other cases' do
      expect(fizzbuzz(7)).to eq('7')
      expect(fizzbuzz(11)).to eq('11')
      expect(fizzbuzz(14)).to eq('14')
    end
  end
end
