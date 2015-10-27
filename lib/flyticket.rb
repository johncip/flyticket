require 'ostruct'
require 'flyticket/client'
require 'flyticket/version'

module Flyticket
  def self.client
    @client ||= Flyticket::Client.new
  end
end

# Prevents returned JSON from being wrapped under a 'table' key.
class OpenStruct
  def as_json(options = nil)
    @table.as_json(options)
  end
end
