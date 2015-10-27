require 'httparty'
require 'ostruct'

module Flyticket
  module Endpoint
    class Base
      include HTTParty

      def self.get_many(fragment, query)
        response = get fragment, query: query

        response[@key].map do |hash|
          OpenStruct.new(hash)
        end
      end
    end
  end
end
