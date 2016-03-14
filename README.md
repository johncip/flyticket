# Flyticket

[![Gem Version](https://badge.fury.io/rb/flyticket.svg)](https://badge.fury.io/rb/flyticket)
[![Build Status](https://travis-ci.org/johncip/flyticket.svg?branch=master)](https://travis-ci.org/johncip/flyticket)

A Ruby gem for communicating with the [Ticketfly REST API](http://start.ticketfly.com/api/), built
on [HTTParty](https://github.com/jnunemaker/httparty).

I want to hear from you! Let me know if you're finding Flyticket useful, or if
you have suggestions on what would make it useful for your project. I'm
currently using it to develop a new website for a Ticketfly "org." I just wanted
a nice wrapper for the API, and the gems I looked at were defunct.

## Example Usage

To query for events, use it like so:

```ruby
past = Flyticket::Events.past(venue_id: 1, max_results: 3)
past.first.facebook_event_id  # --> FB event id for this venue's last show
```

Flyticket is opinionated about the result format -- it discards Ticketfly's
outer wrapper (used for pagination) and converts the top-level hashes and
the nested org and venue hashes into OpenStructs, leaving deeper hashes alone.
So retrieving a deeply-nested attributes looks like this:

```ruby
next_event = Flyticket::Events.upcoming(venue_id: 1, max_results: 1).first
next_event.image[:medium][:width] # --> 'Brooklyn Bowl'

upcoming = Flyticket::Events.upcoming(venue_id: 1, max_results: 3)
upcoming.first.venue.name  # --> 'Brooklyn Bowl'
```

Note how in the first example, `image` is a method, but deeper properties are
accessed using hash keys. In the second example, because `venue` is a struct,
the venue name can be accessed using a method (although `[:name]` works too).

#### Endpoints:
* Events.list(options)
* Events.upcoming(options)
* Events.featured(options)
* Events.past(options)
* Events.just_announced(options)
* Events.event(options)
* Orgs.list(options)
* Venues.list(options)

#### Some useful properties:
* org_id
* venue_id
* event_id
* max_results (capped by Ticketfly at 1000)
* page_num (use when total results > max_results)
* from_date
* thru_date

## Notes

Not attempting semantic versioning just yet because the API may change. (In particular,
I may roll my own classes instead of using OpenStruct).

#### TODO
* [ ] make original json available
* [ ] handle fields & fieldGroup
* [ ] if ticketfly paginates, fetch extra & concatenate
* [ ] specs

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johncip/flyticket.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
