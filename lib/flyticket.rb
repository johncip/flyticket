require 'ostruct'

require 'flyticket/events'
require 'flyticket/venues'
require 'flyticket/orgs'
require 'flyticket/version'

# Monkey-patch OStruct to prevent original JSON from being included.
class OpenStruct
  def as_json(options = nil)
    @table.as_json(options)
  end
end
