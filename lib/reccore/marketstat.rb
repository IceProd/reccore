module Reccore
  # Endpoint: http://api.eve-central.com/api/marketstat
  # Purpose: Retrieve aggregate statistics for the items specified.
  # Allowed methods: GET (parameter list), POST (form data)
  # Return data: XML
  class Marketstat
    class << self; attr_reader :endpoint end
    @endpoint = 'http://api.eve-central.com/api/marketstat?'

    # hours : Statistics from the last X specified hours. Defaults to 24.
    # typeid : The type ID of the item you are requesting. I.e., 34 for Tritanium. Can be specified more than once.
    # minQ : The minimum quantity in an order to consider it for the statistics.
    # regionlimit : Restrict statistics to a region. Can be specified more than once.
    # usesystem : Restrict statistics to a system.
    def initialize(options = {})
      # hours = 24, typeid, minQ = nil, regionlimit = nil, usesystem = nil
      @args = ''
      @args += "#{options[:hours]}&" unless options[:hours].nil?
      parse_typeid(options[:typeid])
      @args += "#{options[:minQ]}&" unless options[:minQ].nil?
      parse_regionlimit(options[:regionlimit]) unless options[:regionlimit].nil?
      @args += "#{options[:usesystem]}&" unless options[:usesystem].nil?
      @marketData = Nokogiri::XML(open(Marketstat.endpoint + @args.chomp('&')))
      price = @marketData.css("all avg")[0].content
      puts "The average market price for type #{options[:typeid]} is #{price}"
    end

    def parse_typeid(typeid)
      if typeid.class == Array
        typeid.each { |type| @args += "typeid=#{type}&" }
      else
        @args += "typeid=#{typeid}&"
      end
    end

    def parse_regionlimit(regionlimit)
      if regionlimit.class == Array
        regionlimit.each { |region| @args += "regionlimit=#{region}&" }
      else
        @args += "regionlimit=#{regionlimit}&"
      end
    end

    def test_xml
      @marketData
    end  
  end
end
