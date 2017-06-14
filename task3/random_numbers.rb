class RandomArray
  def get_rnd_number(array)
    conditional_array = []
    array.each do |each|
      conditional_array << true
    end

    count = array.length
    while count != 0
      rnd_index = rand(array.size)
      if conditional_array[rnd_index] == true
        print array[rnd_index].to_s + " "
        conditional_array[rnd_index] = false
        count -= 1
      end
    end
  end
end

init_array = [4, 8, 15, 16, 23, 42, 7, 11]
puts "Initial array is: \n#{init_array}"

my_array = RandomArray.new
print "Random numbers from initial array is: \n"
print my_array.get_rnd_number(init_array)
