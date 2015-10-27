require 'flyticket'
require 'flyticket/client'
require 'ostruct'
require 'pp'

fc = Flyticket.client

upcoming = fc.upcoming_events(orgId: 747)
p upcoming.first.headlinersName # --> headliner for this org's next event

past = fc.past_events(venueId: 1, maxResults: 5)
pp past.first.to_json  # --> description for this venue's last event
