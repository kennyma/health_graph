module HealthGraph
  class NewFitnessActivity
    include Model
    
    def initialize access_token, params
      self.access_token = access_token
      @body = post "/fitnessActivities", HealthGraph.accept_headers[:new_fitness_activity], params
      populate_from_hash! @body      
    end
  end  
end