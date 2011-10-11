module HealthGraph
  class Profile
    include Model              
    
    hash_attr_accessor :location, :name, :gender, :athlete_type, :profile
    
    def initialize(access_token, path)            
      self.access_token = access_token
      @body = get path, HealthGraph.accept_headers[:profile]
      populate_from_hash! @body      
    end                   
    
    def elite?
      @body["elite"] == "true"
    end
  end
end