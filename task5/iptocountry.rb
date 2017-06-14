class MyIp
  def print_country(input_ip)
    encoded_ip = encode(input_ip)
    puts get_country(get_database, encoded_ip)
  end

  private

  def encode(input_string)
    ip_str_array = input_string.split('.')
    ip_arr = ip_str_array.map(&:to_i)
    ip_arr[0] * (256**3) + ip_arr[1] * (256**2) + ip_arr[2] * 256 + ip_arr[3]
  end

  def get_database
    database = []
    IO.foreach('IpToCountry.csv') do |line|
      unless line.include? '#'
        database << line.chomp!.gsub!(/["]/, '').split(/[,]/)
      end
    end
    database
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
