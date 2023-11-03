class Solver
  def factorial(_number)
    raise ArgumentError, 'Factorial is not defined for negative numbers.' if n.negative?

    result = 1
    (1..n).each do |i|
      result *= i
    end

    result
  end
end
