# TODO: handle fields & fieldGroup
# TODO: make original response available
# TODO: specs

require 'httparty'
require 'ostruct'
require 'plissken'

require 'flyticket/ticketfly_error'
require 'flyticket/util'

module Flyticket
  class Endpoint
    include HTTParty

    # Returns the key used to get the list of entries from Ticketfly's response.
    def self.key
      base_uri.split('/').last
    end

    # Gets a single event
    def self.get_many(fragment, options)
      response = get fragment, query: query_string(options)

      handle_error(response)
      response[key].map { |hash| objectify(hash) }
    end

    # Gets a single event
    def self.get_one(fragment, options)
      response = get fragment, query: query_string(options)

      handle_error(response)
      objectify response[key].first
    end

    private

    # Camelcases the given options hash.
    def self.query_string(options)
      options.map { |k, v| [Util.camelize(k, false), v] }.to_h
    end

    # Converts keys to snake case, then "semi-recursively" converts to OpenStruct.
    def self.objectify(hash)
      hash = hash.to_snake_keys

      to_struct(hash, :venue)
      to_struct(hash, :org)
      OpenStruct.new(hash)
    end

    # Replaces a nested hash with a struct, given the parent hash and key.
    def self.to_struct(hash, key)
      return unless hash.has_key? key
      hash[key] = OpenStruct.new(hash[key])
    end

    # Raises an error if the response indicates a problem.
    def self.handle_error
      if response['status'] == 'error'
        raise TicketflyError.new(response)
      end
    end
  end
end
