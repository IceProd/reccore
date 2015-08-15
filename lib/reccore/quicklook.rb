module Reccore
  # Endpoint: http://api.eve-central.com/api/quicklook
  # Purpose: Retrieve all of the available market orders, including prices, stations, order IDs, volumes, etc.
  # Allowed methods: GET (parameter list), POST (form data)
  # Return type: XML
  # ref: http://dev.eve-central.com/evec-api/start
  class Quicklook
    class << self; attr_reader :endpoint end
    @endpoint = 'http://api.eve-central.com/api/quicklook'
  end
end
