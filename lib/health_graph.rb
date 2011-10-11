require 'oauth2'
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

module HealthGraph
  extend Configuration 
  extend Authentication 
end