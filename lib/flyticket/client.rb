require 'flyticket/endpoint/events'

module Flyticket
  class Client
    def upcoming_events(args)
      Flyticket::Endpoint::Events.upcoming(args)
    end
  end
end
