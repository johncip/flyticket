require 'httparty'
require 'ostruct'

module Flyticket
  module Endpoint
    class Base
      include HTTParty

      def self.get_struct(path, args)
        response = get path, query: args
        OpenStruct.new(response)
      end
    end
  end
end
