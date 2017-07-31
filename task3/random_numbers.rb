class RandomArray
  attr_accessor :array, :arr_length

  def initialize(array)
    @array = array
    @length = array.length
  end

  def get_rnd_item
    if @length > 0
      rnd_index = rand(@length)
      rnd_number = @array[rnd_index]
      @array[@length - 1], @array[rnd_index] = @array[rnd_index], @array[@length - 1]
      @length -= 1
      rnd_number
    else
      "Array is empty!"
    end
  end
end

init_array = [1, 2, 3, 4, 5]
puts "Initial array is: \n#{init_array}"

my_array = RandomArray.new(init_array)
puts "Random number from initial array is:"
puts my_array.get_rnd_item
puts my_array.get_rnd_item
puts my_array.get_rnd_item
puts my_array.get_rnd_item
puts my_array.get_rnd_item
puts my_array.get_rnd_item
