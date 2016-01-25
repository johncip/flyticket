require 'flyticket/endpoint/events'

module Flyticket
  class Client
    def upcoming_events(args)
      VCR.use_cassette 'events_upcoming' do
        Flyticket::Endpoint::Events.upcoming(args)
      end
    end

    def past_events(args)
      VCR.use_cassette 'events_past' do
        Flyticket::Endpoint::Events.past(args)
      end
    end

    def list_events(args)
      VCR.use_cassette 'events_list' do
        Flyticket::Endpoint::Events.list(args)
      end
    end
  end
end
