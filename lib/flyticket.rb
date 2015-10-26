require 'flyticket/client'

module Flyticket
  def self.client
    @client ||= Flyticket::Client.new
  end
end
