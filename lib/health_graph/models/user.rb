module HealthGraph
  class User
    include Model

    hash_attr_accessor :userID

    def initialize(access_token)
      self.access_token = access_token
      response = get 'user', HealthGraph.accept_headers[:user]
      self.body = response.body
      populate_from_hash! body
    end

    def profile
      HealthGraph::Profile.new access_token, body['profile']
    end

    def settings
      HealthGraph::Settings.new access_token, body['settings']
    end

    def weight
      HealthGraph::WeightFeed.new access_token, body['weight']
    end

    def sleep
      HealthGraph::SleepFeed.new access_token, body['sleep']
    end

    def fitness_activities(params = {})
      HealthGraph::FitnessActivitiesFeed.new access_token, body['fitness_activities'], params
    end

    def new_fitness_activity(params)
      HealthGraph::NewFitnessActivity.new access_token, params
    end

    def fitness_activity_update(params)
      HealthGraph::FitnessActivityUpdate.new access_token, params
    end

    def fitness_activity_delete(params)
      HealthGraph::FitnessActivityDelete.new access_token, params
    end

    def strength_training_activities(params = {})
      HealthGraph::StrengthTrainingActivitiesFeed.new access_token, body['strength_training_activities'], params
    end
  end
end
