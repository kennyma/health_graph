module HealthGraph
  class Records
    include Model              
    
    hash_attr_accessor :activity_type
    
    def initialize(access_token, path)            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:records]
      self.body = response.body
      populate_from_hash! self.body
    end                   
    
  end
end