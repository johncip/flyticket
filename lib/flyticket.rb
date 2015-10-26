require 'flyticket/client'
require 'flyticket/version'

module Flyticket
  def self.client
    @client ||= Flyticket::Client.new
  end
end
