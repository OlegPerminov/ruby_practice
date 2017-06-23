class MyIp
  require 'csv'
  require 'ipaddr'
  require 'segment_tree'

  def initialize
    database = {}
    CSV.foreach('IpToCountry.csv', encoding:'iso-8859-1', \
      converters: :numeric, skip_lines: /[#]/) do |row|
      database[row[0]..row[1]] = row[4]
    end
    @ip_tree = SegmentTree.new(database)
  end

  def print_country(input_ip)
    encoded_ip = encode_ip(input_ip)
    puts @ip_tree.find(encoded_ip).value
  end

  private

  def encode_ip(input_string)
    IPAddr.new(input_string).to_i
  end
end

ip_finder = MyIp.new
ip_adress = ARGV[0].nil? ? '0.0.0.0' : ARGV[0]
ip_finder.print_country(ip_adress)
