module HealthGraph
  class FitnessActivitiesFeed
    include Model              
    
    hash_attr_accessor :items, :next, :previous, :size
    
    class Item 
      include Model      
      
      hash_attr_accessor :type, :start_time, :total_distance, :duration, :uri
      coerce_key :start_time, HealthGraph::DateTime

      def initialize(hash) 
        populate_from_hash! hash
      end
    end

    def initialize(access_token, path, params = {})            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:fitness_activity_feed], params
      self.body = response.body
      populate_from_hash! self.body
    end

    protected

    def unpack_items value
      value.map do |hash|
        Item.new hash
      end
    end
  end
end