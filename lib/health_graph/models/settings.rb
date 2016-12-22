module HealthGraph
  class Settings
    include Model

    hash_attr_accessor :distance_units, :weight_units

    def initialize(access_token, path)
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:settings]
      self.body = response.body
      populate_from_hash! body
    end

    def elite?
      body['elite'] == 'true'
    end
  end
end
