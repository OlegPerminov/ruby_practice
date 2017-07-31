module MyCounter
  def self.numbers_count(first_array, second_array)
    array = first_array + second_array
    array = array.flatten
    array = array.compact
    array.each_with_object(Hash.new(0)) do |number, count|
      count[number] += 1
    end
  end
end

array_one = [7, 14, 21, [5, 1], nil, 3, 5, 4, 5]
array_two = [nil, 4, 5, 3, 7, [[nil, nil], 7], nil]
array_three = [1, [7, 7], 3, nil]

puts "array_one is: #{array_one}"
puts "array_two is: #{array_two}"
puts "array_three is: #{array_three}\n\n"

one_and_two = MyCounter.numbers_count(array_one, array_two)
two_and_three = MyCounter.numbers_count(array_two, array_three)

puts "array_one + array_two count is: #{one_and_two}"
puts "array_two + array_three count is: #{two_and_three}"
