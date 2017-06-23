class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Circle
  attr_reader :center, :radius

  def initialize(x, y, r)
    @center = Point.new(x, y)
    @radius = r
  end

  def check_points(input_array)
    input_points = create_points(input_array)
    included_points = input_points.select { |point| include?(point) }
    get_coordinates(included_points)
  end

  private

  def create_points(numbers_array)
    numbers_array.map { |item| Point.new(item[0], item[1]) }
  end

  def get_coordinates(points_array)
    points_array.map { |point| [point.x, point.y] }
  end

  def include?(point)
    (@center.x - point.x)**2 + (@center.y - point.y)**2 <= @radius**2
  end
end

test_points = [[0, 0], [1, 0], [0, 1], [1, 1], [2, 2], [0.5, 0.5]]
puts "Initial array is: \n#{test_points}"

my_circle = Circle.new(0, 0, 1)
puts "The circle with center in x = #{my_circle.center.x}, \
y = #{my_circle.center.y} and radius = #{my_circle.radius} have:"
puts my_circle.check_points(test_points).to_s
