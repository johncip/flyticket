require 'flyticket'
require 'flyticket/client'
require 'pp'

client = Flyticket.client
pp client.upcoming_events({orgId: 747})
