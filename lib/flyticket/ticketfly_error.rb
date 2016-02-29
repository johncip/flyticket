module Flyticket
  class TicketflyError < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def code
      response['code']
    end

    def error_message
      response['codeError']
    end

    def to_s
      response.pretty_inspect
    end
  end
end
