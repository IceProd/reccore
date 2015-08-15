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
      # hours = 24, typeid, minQ = nil, regionlimit = nil, usesystem = '30000142' (Jita)
      @args = ''
      @args += "hours=#{options[:hours]}&" unless options[:hours].nil?
      parse_typeid(options[:typeid])
      @args += "minQ=#{options[:minQ]}&" unless options[:minQ].nil?
      parse_regionlimit(options[:regionlimit]) unless options[:regionlimit].nil?
      @args += 'usesystem=30000142&' if options[:regionlimit].nil?
      @args += "usesystem=#{options[:usesystem]}&" unless options[:usesystem].nil?
      p @args.chomp('&')
      xml = Nokogiri::XML(open(Marketstat.endpoint + @args.chomp('&')))
      update(xml)
      Reccore.cache.cleanup!
    end

    def parse_typeid(typeid)
      if typeid.is_a?(Array)
        typeid.each { |type| @args += "typeid=#{type}&" }
      else
        @args += "typeid=#{typeid}&"
      end
    end

    def parse_regionlimit(regionlimit)
      if regionlimit.is_a?(Array)
        regionlimit.each { |region| @args += "regionlimit=#{region}&" }
      else
        @args += "regionlimit=#{regionlimit}&"
      end
    end

    def update(xml)
      elements = xml.xpath('//type')
      elements.each do |element|
        Reccore.cache[element['id'], 3600] = update_buy(element), update_sell(element)
      end
    end

    def update_buy(element)
      {:buy =>
        {:volume => element.css('buy/volume').text,
         :avg => element.css('buy/avg').text,
         :max => element.css('buy/max').text,
         :min => element.css('buy/min').text,
         :stddev => element.css('buy/stddev').text,
         :median => element.css('buy/median').text,
         :percentile => element.css('buy/percentile').text,
          },
        }
    end

    def update_sell(element)
      {:sell =>
        {:volume => element.css('sell/volume').text,
         :avg => element.css('sell/avg').text,
         :max => element.css('sell/max').text,
         :min => element.css('sell/min').text,
         :stddev => element.css('sell/stddev').text,
         :median => element.css('sell/median').text,
         :percentile => element.css('sell/percentile').text,
          },
        }
    end
  end
end
