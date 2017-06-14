class Circle
  attr_accessor :coord_x, :coord_y, :radius

  def initialize(x, y, r)
    @coord_x = x
    @coord_y = y
    @radius = r
  end

  def check_points(input_array)
    print check(input_array).to_s + "\n"
  end

  private

  def check(input_points)
    areas_points = []
    input_points.each do |coord|
      if (coord[0] - @coord_x)**2 \
         + (coord[1] - @coord_y)**2 \
         <= @radius**2
         areas_points << coord
      end
    end
    areas_points
  end
end

test_points = [[0, 0], [1, 0], [0, 1], [1, 1], [2, 2], [0.5, 0.5]]

puts "Initial array is: \n#{test_points}"

my_circle = Circle.new(0, 0, 1)

print "The circle with center in x = #{my_circle.coord_x}, \
y = #{my_circle.coord_y} and radius = #{my_circle.radius} have: \n"
my_circle.check_points(test_points)
