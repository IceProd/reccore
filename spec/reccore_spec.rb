require 'reccore'
require 'coveralls'
Coveralls.wear!

RSpec.describe Reccore do
  it 'Perform a request to Eve Central and return values' do
    tritanium = Reccore::EC.new
    puts "The min sell value for tritanium is #{tritanium.get_sell_min('34')}"
  end
end
