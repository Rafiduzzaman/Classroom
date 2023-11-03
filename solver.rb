class Solver
  def factorial(_number)
    raise ArgumentError, 'Factorial is not defined for negative numbers.' if _number.negative?

    result = 1
    (1.._number).each do |i|
      result *= i
    end

    result
  end
end
