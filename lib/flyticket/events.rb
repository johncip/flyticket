require 'flyticket/endpoint'

module Flyticket
  class Events < Endpoint
    base_uri 'www.ticketfly.com/api/events'

    def self.list(options)
      get_many '/list.json', options
    end

    def self.upcoming(options)
      get_many '/upcoming.json', options
    end

    def self.featured(options)
      get_many '/featured.json', options
    end

    def self.past(options)
      get_many '/past.json', options
    end

    def self.just_announced(options)
      get_many '/justAnnounced.json', options
    end

    def self.event(options)
      get_one '/event.json', options
    end
  end
end
