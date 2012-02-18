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
                      
    def initialize(access_token, path)            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:fitness_activity_feed]
      self.body = response.body
      populate_from_hash! self.body
    end                           
  end
end