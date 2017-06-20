class MyIp
  require 'csv'
  require 'ipaddr'

  def print_country(input_ip)
    encoded_ip = encode(input_ip)
    puts get_country(get_database, encoded_ip)
  end

  private

  def encode(input_string)
    ipaddr1 = IPAddr.new(input_string)
    ipaddr1.to_i
  end

  def get_database
    CSV.read('IpToCountry.csv', encoding:'iso-8859-1', skip_lines: /[#]/)
  end

  def get_country(database_array, number = 0)
    answer = ''
    database_array.each do |line|
      start_range = line[0].to_i
      end_range = line[1].to_i
      range = start_range..end_range
      if range.include?(number)
        answer = line[4]
        break
      end
    end
    answer
  end
end

ip_adress = !ARGV[0].nil? ? ARGV[0] : '0'
MyIp.new.print_country(ip_adress)
