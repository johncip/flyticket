require 'flyticket/version'
require 'flyticket/events'
require 'flyticket/venues'
require 'flyticket/orgs'

# Prevents returned JSON from being wrapped under a 'table' key.
require 'ostruct'

class OpenStruct
  def as_json(options = nil)
    @table.as_json(options)
  end
end
