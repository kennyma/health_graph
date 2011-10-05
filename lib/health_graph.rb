require 'oauth2'
require 'faraday_middleware'
require 'health_graph/configuration'
require 'health_graph/authentication'
require 'health_graph/api'
require 'health_graph/user'

module HealthGraph
  extend Configuration 
  extend Authentication 
end