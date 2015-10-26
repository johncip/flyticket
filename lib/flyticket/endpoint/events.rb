require 'flyticket/endpoint/base'

module Flyticket
  module Endpoint
    class Events < Base
      base_uri 'www.ticketfly.com/api/events'

      def self.upcoming(args)
        get_struct '/upcoming.json', args
      end

      def self.past(args)
        get_struct '/past.json', args
      end
    end
  end
end
