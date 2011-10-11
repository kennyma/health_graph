module HealthGraph
  class User
    include Model
          
    hash_attr_accessor :userID
     
    def initialize(access_token)            
      self.access_token = access_token
      @body = get "user", HealthGraph.accept_headers[:user]
      populate_from_hash! @body      
    end
        
    def profile      
      HealthGraph::Profile.new self.access_token, @body["profile"]      
    end        
    
    def weight
      HealthGraph::WeightFeed.new self.access_token, @body["weight"]
    end
    
    def sleep
      HealthGraph::SleepFeed.new self.access_token, @body["sleep"]
    end
    
    def fitness_activities
      HealthGraph::FitnessActivitiesFeed.new self.access_token, @body["fitness_activities"]
    end
  end
end