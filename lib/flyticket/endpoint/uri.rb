require 'uri'
require 'flyticket'

module Flyticket
  module Endpoint
    class Path
      def self.build(path, filter, args)
        query = URI.encode_www_form(args)
        "#{Flyticket::API_HOST}/#{path}/#{filter}/?#{query}"
      end
    end
  end
end
