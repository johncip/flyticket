require 'flyticket/endpoint'

module Flyticket
  class Venues < Endpoint
    base_uri 'www.ticketfly.com/api/venues'

    def self.list(options)
      get_many '/list.json', options
    end
  end
end
