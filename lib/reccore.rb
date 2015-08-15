require 'nokogiri'
require 'open-uri'

require 'reccore/version'
require 'reccore/vash'
require 'reccore/marketstat'

module Reccore
  class << self; attr_accessor :cache end
  @cache = Vash.new

  # :volume => element.css('buy/volume').text,
  # :avg => element.css('buy/avg').text,
  # :max => element.css('buy/max').text,
  # :min => element.css('buy/min').text,
  # :stddev => element.css('buy/stddev').text,
  # :median => element.css('buy/median').text,
  # :percentile => element.css('buy/percentile').text

  class EC
    def get_buy_volume(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:volume]
      else
        Reccore.cache[typeid.to_s].first[:buy][:volume]
      end
    end

    def get_buy_avg(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:avg]
      else
        Reccore.cache[typeid.to_s].first[:buy][:avg]
      end
    end

    def get_buy_max(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:max]
      else
        Reccore.cache[typeid.to_s].first[:buy][:max]
      end
    end

    def get_buy_min(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:min]
      else
        Reccore.cache[typeid.to_s].first[:buy][:min]
      end
    end

    def get_buy_stddev(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:stddev]
      else
        Reccore.cache[typeid.to_s].first[:buy][:stddev]
      end
    end

    def get_buy_median(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:median]
      else
        Reccore.cache[typeid.to_s].first[:buy][:median]
      end
    end

    def get_buy_percentile(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].first[:buy][:percentile]
      else
        Reccore.cache[typeid.to_s].first[:buy][:percentile]
      end
    end

    def get_sell_volume(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:volume]
      else
        Reccore.cache[typeid.to_s].last[:sell][:volume]
      end
    end

    def get_sell_avg(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:avg]
      else
        Reccore.cache[typeid.to_s].last[:sell][:avg]
      end
    end

    def get_sell_max(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:max]
      else
        Reccore.cache[typeid.to_s].last[:sell][:max]
      end
    end

    def get_sell_min(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:min]
      else
        Reccore.cache[typeid.to_s].last[:sell][:min]
      end
    end

    def get_sell_stddev(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:stddev]
      else
        Reccore.cache[typeid.to_s].last[:sell][:stddev]
      end
    end

    def get_sell_median(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:median]
      else
        Reccore.cache[typeid.to_s].last[:sell][:median]
      end
    end

    def get_sell_percentile(typeid)
      if Reccore.cache[typeid.to_s].nil?
        Reccore::Marketstat.new(:typeid => typeid.to_s)
        Reccore.cache[typeid.to_s].last[:sell][:percentile]
      else
        Reccore.cache[typeid.to_s].last[:sell][:percentile]
      end
    end
  end
end
