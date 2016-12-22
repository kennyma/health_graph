require 'oauth2'
require 'json'
require 'faraday_middleware'
require 'health_graph/configuration'
require 'health_graph/authentication'
require 'health_graph/api'
require 'health_graph/model'
require 'health_graph/models/user'
require 'health_graph/models/profile'
require 'health_graph/models/weight_feed'
require 'health_graph/models/sleep_feed'
require 'health_graph/models/fitness_activities_feed'
require 'health_graph/models/strength_training_activities_feed'
require 'health_graph/models/new_fitness_activity'
require 'health_graph/models/fitness_activity_update'
require 'health_graph/models/fitness_activity_delete'
require 'health_graph/models/settings'

module HealthGraph
  extend Configuration
  extend Authentication
end
