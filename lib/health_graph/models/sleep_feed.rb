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
      
      protected
      
      def coerce_timestamp(value)
        unless value.is_a? DateTime
          DateTime.strptime(value, "%a, %d %b %Y %H:%M:%S")
        else
          value
        end
      end  
    end
                      
    def initialize(access_token, path)            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:sleep_feed]
      self.body = response.body
      populate_from_hash! self.body                  
    end

    protected

    def coerce_items value
      value.map do |hash|
        Item.new hash
      end
    end                          
  end
end