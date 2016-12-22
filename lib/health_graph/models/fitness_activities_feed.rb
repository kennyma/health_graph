module HealthGraph
  class FitnessActivitiesFeed
    include Model

    hash_attr_accessor :items, :next, :previous, :size

    class Item
      include Model

      hash_attr_accessor :type, :start_time, :total_distance, :duration, :uri

      def initialize(hash)
        populate_from_hash! hash
      end
    end

    def initialize(access_token, path, params = {})
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:fitness_activity_feed], params
      self.body = response.body
      populate_from_hash! body
    end

    def previous_page
      self.class.new(access_token, self.previous)
    end

    def next_page
      self.class.new(access_token, self.next)
    end
  end
end
