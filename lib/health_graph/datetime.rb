require "date"

module HealthGraph
  class DateTime < ::DateTime
    def self.coerce value
      strptime value, "%a, %d %b %Y %H:%M:%S"
    end
  end
end
