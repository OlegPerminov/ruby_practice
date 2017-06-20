class DigitVisualize
  def initialize
    one =   ["     ", "    |", "    |", "    |", "    |"]
    two =   ["  __ ", "    |", "  __ ", " |   ", "  __ "]
    three = ["  __ ", "    |", "  __ ", "    |", "  __ "]
    four =  ["     ", " |  |", "  __ ", "    |", "    |"]
    five =  ["  __ ", " |   ", "  __ ", "    |", "  __ "]
    six =   ["  __ ", " |   ", "  __ ", " |  |", "  __ "]
    seven = ["  __ ", "    |", "    |", "    |", "    |"]
    eight = ["  __ ", " |  |", "  __ ", " |  |", "  __ "]
    nine =  ["  __ ", " |  |", "  __ ", "    |", "  __ "]
    zero =  ["  __ ", " |  |", " |  |", " |  |", "  __ "]

    @digit_array = [zero, one, two, three, four,
      five, six, seven, eight, nine]
  end

  def print_lcd(input_number)
    printing_string = get_digit(input_number)
    printing_string.each { |line| puts line }
  end

  private

  def get_digit(input_string)
    output_string = ["", "", "", "", ""]
    number_array = []
    input_string.each_char { |char| number_array << char.to_i }

    number_array.each do |index|
      temp_string = @digit_array[index]
      for line in 0...temp_string.length
        output_string[line] += temp_string[line]
      end
    end
    output_string
  end
end

printing_number = ARGV[0] != nil ? ARGV[0] : "1234567890"
DigitVisualize.new.print_lcd(printing_number)
