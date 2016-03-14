# TODO: convert to specs
# TODO: dynamic cassette name

require 'flyticket'
require 'ostruct'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

def test_events_upcoming
  VCR.use_cassette 'events/upcoming' do
    upcoming = Flyticket::Events.upcoming(venueId: 1, maxResults: 3)
    fail unless upcoming.first.venue.name == 'Brooklyn Bowl'
  end
end

def test_events_event
  VCR.use_cassette 'events/event' do
    event = Flyticket::Events.event(eventId: 2)
    fail unless event.name == 'Tragedy: A Metal Tribute to the Bee Gees'
  end
end

def test_events_past
  VCR.use_cassette 'events/past' do
    past = Flyticket::Events.past(venueId: 1, maxResults: 3)
    fail unless past.first.venue.name == 'Brooklyn Bowl'
  end
end

def test_events_featured
  VCR.use_cassette 'events/featured' do
    featured = Flyticket::Events.featured(venueId: 1, maxResults: 3)
    fail unless featured.first.venue.name == 'Brooklyn Bowl'
  end
end

def test_events_just_announced
  VCR.use_cassette 'events/just_announced' do
    just_announced = Flyticket::Events.just_announced(venueId: 1, maxResults: 3)
    fail unless just_announced.first.venue.name == 'Brooklyn Bowl'
  end
end

def test_orgs_list
  VCR.use_cassette 'orgs/list' do
    orgs = Flyticket::Orgs.list(orgId: 3, maxResults: 1)
    fail unless orgs.first.name == 'Brooklyn Bowl'
  end
end

def test_venues_list
  VCR.use_cassette 'venues/list' do
    venues = Flyticket::Venues.list(venueId: 1, maxResults: 1)
    fail unless venues.first.name == 'Brooklyn Bowl'
  end
end


def print_methods
  VCR.use_cassette 'events/past' do
    past = Flyticket::Events.past(venueId: 1, maxResults: 3)
    keys = past.first.methods(false)
    puts keys.delete_if { |m| m.to_s.end_with? '=' }.inspect
  end
end

test_events_upcoming
test_events_past
test_events_featured
test_events_just_announced
test_events_event
test_orgs_list
test_venues_list

# print_methods
