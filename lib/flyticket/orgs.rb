require 'flyticket/endpoint'

module Flyticket
  class Orgs < Endpoint
    base_uri 'www.ticketfly.com/api/orgs'

    def self.list(options)
      get_many '/list.json', options
    end
  end
end
