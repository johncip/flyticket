module Flyticket
  class Util
    # Adapted an old version of ActiveSupport.
    def self.camelize(term, first_letter_in_uppercase = true)
      if first_letter_in_uppercase
        term.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
      else
        term[0] + camelize(term)[1..-1]
      end
    end
  end
end
