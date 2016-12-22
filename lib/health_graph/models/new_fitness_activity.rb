module HealthGraph
  class NewFitnessActivity
    include Model

    hash_attr_accessor :location, :status

    def initialize(access_token, params)
      self.access_token = access_token
      response = post '/fitnessActivities', HealthGraph.accept_headers[:new_fitness_activity], params

      self.location = response.headers[:location]
      self.status = response.status
    end
  end
end
