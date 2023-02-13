class Triangle
  class TriangleError < StandardError
  end

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    return :equilateral if @side1 == @side2 && @side2 == @side3
    return :isosceles if @side1 == @side2 || @side1 == @side3 || @side2 == @side3
    :scalene
  end

  private

  def validate_triangle
    sides = [@side1, @side2, @side3]
    raise TriangleError if sides.include?(0) || sides.min <= 0
    raise TriangleError if @side1 + @side2 <= @side3 ||
                           @side1 + @side3 <= @side2 ||
                           @side2 + @side3 <= @side1
  end
end

