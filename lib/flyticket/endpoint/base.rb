require 'httparty'
require 'ostruct'

module Flyticket
  module Endpoint
    class Base
      include HTTParty

      def self.get_many(fragment, query)
        response = get fragment, query: query

        response[@key].map do |hash|
          wrap(hash, 'venue')
          wrap(hash, 'org')
          OpenStruct.new(hash)
        end
      end

      def self.wrap(hash, key)
        hash[key] = OpenStruct.new(hash[key])
      end
    end
  end
end
