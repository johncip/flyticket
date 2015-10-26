require 'flyticket/endpoint/events'

module Flyticket
  class Client
    def initialize
      @events = Flyticket::Endpoint::Events.new
    end

    def upcoming_events(args)
      events.upcoming(args)
    end

    private

    attr_reader :events
  end
end
