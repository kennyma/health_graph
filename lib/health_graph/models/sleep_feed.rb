module HealthGraph
  class SleepFeed
    include Model

    hash_attr_accessor :items

    class Item
      include Model

      hash_attr_accessor :timestamp, :total_sleep, :times_woken, :rem, :deep, :light, :awake, :uri

      def initialize(hash)
        populate_from_hash! hash
      end
    end

    def initialize(access_token, path)
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:sleep_feed]
      self.body = response.body
      populate_from_hash! body
    end
  end
end
