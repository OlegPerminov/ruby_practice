class MyIp
  require 'csv'
  require 'ipaddr'

  def print_country(input_ip)
    encoded_ip = encode_ip(input_ip)
    puts find_country(encoded_ip)
  end

  private

  def encode_ip(input_string)
    IPAddr.new(input_string).to_i
  end

  def find_country(number)
    answer = ''
    CSV.foreach('IpToCountry.csv', encoding:'iso-8859-1', \
      converters: :numeric, skip_lines: /[#]/) do |line|
      range = line[0]..line[1]
      if range.include?(number)
        answer = line[4]
        break
      end
    end
    answer
  end
end

ip_adress = !ARGV[0].nil? ? ARGV[0] : '0.0.0.0'
MyIp.new.print_country(ip_adress)
