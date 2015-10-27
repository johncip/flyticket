require 'flyticket/endpoint/base'

module Flyticket
  module Endpoint
    class Events < Base
      base_uri 'www.ticketfly.com/api/events'
      @key = 'events'

      def self.upcoming(args)
        get_many('/upcoming.json', args)
      end

      def self.past(args)
        get_many('/past.json', args)
      end

      def self.list(args)
        get_many('/list.json', args)
      end
    end
  end
end
