module HealthGraph
  class FitnessActivityDelete
    include Model

    hash_attr_accessor :location, :status

    def initialize(access_token, params)
      self.access_token = access_token
      response = delete params['uri'], HealthGraph.accept_headers[:fitness_activity], params

      self.location = response.headers[:location]
      self.status = response.status
    end
  end
end
