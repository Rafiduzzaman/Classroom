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

  def fizzbuzz(n)
  if n % 3 == 0 && n % 5 == 0
    return "fizzbuzz"
  elsif n % 3 == 0
    return "fizz"
  elsif n % 5 == 0
    return "buzz"
  else
    return n.to_s
  end
end
end
