require 'flyticket'
require 'flyticket/client'
require 'pp'
require 'ostruct'

client = Flyticket.client
response = client.upcoming_events(orgId: 747)
event = response['events'].first
os = OpenStruct.new(event)

pp os.org
