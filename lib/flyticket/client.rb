require 'flyticket/endpoint/events'

module Flyticket
  class Client
    def upcoming_events(args)
      Flyticket::Endpoint::Events.upcoming(args)
    end

    def past_events(args)
      Flyticket::Endpoint::Events.past(args)
    end

    def list_events(args)
      Flyticket::Endpoint::Events.list(args)
    end
  end
end
