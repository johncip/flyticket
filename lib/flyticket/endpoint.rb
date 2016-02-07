# TODO: handle error response
# TODO: handle fields & fieldGroup
# TODO: make original response available
# TODO: specs

require 'httparty'
require 'ostruct'
require 'plissken'

module Flyticket
  class Endpoint
    include HTTParty

    def self.key
      base_uri.split('/').last
    end

    def self.get_many(fragment, query)
      response = get fragment, query: query
      response[key].map { |hash| objectify(hash) }
    end

    def self.get_one(fragment, query)
      response = get fragment, query: query
      objectify response[key].first
    end

    private

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
  end
end