[![Coverage Status](https://coveralls.io/repos/IceProd/reccore/badge.svg?branch=master&service=github)](https://coveralls.io/github/IceProd/reccore?branch=master)
[![Build Status](https://travis-ci.org/IceProd/reccore.svg?branch=master)](https://travis-ci.org/IceProd/reccore)

# Reccore

A ruby library for [Eve Central](https://eve-central.com/home/develop.html)

This is currently a **work in progress**. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reccore'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reccore

## Tests


```ruby
RSpec.describe Reccore do
  it 'Perform a request to Eve Central and return values' do
    tritanium = Reccore::EC.new
    puts "The min sell value for tritanium is #{tritanium.get_sell_min('34')}"
  end
end
```

Result
```ruby
The min sell value for tritanium is 5.25

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## CCP Copyright Notice

EVE Online and the EVE logo are the registered trademarks of CCP hf. All rights are reserved worldwide. All other trademarks are the property of their respective owners. EVE Online, the EVE logo, EVE and all associated logos and designs are the intellectual property of CCP hf. All artwork, screenshots, characters, vehicles, storylines, world facts or other recognizable features of the intellectual property relating to these trademarks are likewise the intellectual property of CCP hf. CCP hf. has granted permission to evepaste to use EVE Online and all associated logos and designs for promotional and information purposes on its website but does not endorse, and is not in any way affiliated with, evepaste. CCP is in no way responsible for the content on or functioning of this website, nor can it be liable for any damage arising from the use of this website.

