module HealthGraph
  class User
    include Model
          
    hash_attr_accessor :userID
     
    def initialize(access_token)            
      self.access_token = access_token
      response = get "user", HealthGraph.accept_headers[:user]
      self.body = response.body
      populate_from_hash! self.body      
    end
        
    def profile      
      HealthGraph::Profile.new self.access_token, self.body["profile"]      
    end        
    
    def weight
      HealthGraph::WeightFeed.new self.access_token, self.body["weight"]
    end
    
    def sleep
      HealthGraph::SleepFeed.new self.access_token, self.body["sleep"]
    end
    
    def fitness_activities
      HealthGraph::FitnessActivitiesFeed.new self.access_token, self.body["fitness_activities"]
    end
    
    def new_fitness_activity(params)
      HealthGraph::NewFitnessActivity.new self.access_token, params
    end
  end
end