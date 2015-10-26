require 'httparty'
require 'flyticket'

module Flyticket
  module Endpoint
    class Events
      include HTTParty
      base_uri 'www.ticketfly.com/api/events'

      def self.upcoming(options)
        get '/upcoming.json', query: options
      end

      def self.past(options)
        get '/past.json', query: options
      end
    end
  end
end
