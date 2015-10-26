require 'httparty'
require 'uri'
require 'flyticket'
require 'flyticket/endpoint/uri'

module Flyticket
  module Endpoint
    class Events
      include HTTParty

      base_uri 'www.ticketfly.com/api/events'

      def upcoming(options)
        self.class.get '/upcoming.json', query: options
      end

    end
  end
end
