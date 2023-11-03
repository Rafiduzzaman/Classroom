class Solver
  def factorial(number)
    raise ArgumentError, 'Factorial is not defined for negative numbers.' if number.negative?

    result = 1
    (1..number).each do |i|
      result *= i
    end

    result
  end

  def reverse(word)
    word.reverse
  end
end
