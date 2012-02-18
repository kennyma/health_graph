module HealthGraph
  class WeightFeed
    include Model              
    
    hash_attr_accessor :items
    
    class Item 
      include Model      
      
      hash_attr_accessor :timestamp, :weight, :free_mass, :mass_weight, :fat_percent, :bmi, :uri
      
      def initialize(hash) 
        populate_from_hash! hash
      end      
    end
                      
    def initialize(access_token, path)            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:weight_feed]
      self.body = response.body
      populate_from_hash! self.body                  
    end                           
  end
end