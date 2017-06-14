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

    @digit_hash =
    { "1" => one, "2" => two,
      "3" => three, "4" => four,
      "5" => five, "6" => six,
      "7" => seven, "8" => eight,
      "9" => nine, "0" => zero }
  end

  def print_lcd(input_number)
    printing_string = get_digit(input_number)
    printing_string.each { |line| puts line }
  end

  private

  def get_digit(input_string)
    output_string = ["", "", "", "", ""]
    input_string.each_char do |letter|
      temp_string = @digit_hash[letter]
      for line in 0...temp_string.length
        output_string[line] += temp_string[line]
      end
    end
    output_string
  end
end

printing_number = ARGV[0] != nil ? ARGV[0] : "1234567890"
DigitVisualize.new.print_lcd(printing_number)
