require 'ostruct'
require 'flyticket/client'
require 'flyticket/version'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

# Prevents returned JSON from being wrapped under a 'table' key.
class OpenStruct
  def as_json(options = nil)
    @table.as_json(options)
  end
end

module Flyticket
  def self.client
    @client ||= Flyticket::Client.new
  end
end
