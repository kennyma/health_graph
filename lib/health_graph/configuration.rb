module HealthGraph
  module Configuration
    VALID_OPTIONS_KEYS = [
      :client_id,
      :client_secret,
      :authorization_url,
      :access_token_url,
      :authorization_redirect_url,
      :endpoint,
      :adapter,
      :faraday_options,
      :accept_headers
    ].freeze

    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_SECRET = nil
    DEFAULT_AUTHORIZATION_URL = 'https://runkeeper.com/apps/authorize'.freeze
    DEFAULT_ACCESS_TOKEN_URL = 'https://runkeeper.com/apps/token'.freeze
    DEFAULT_AUTHORIZATION_REDIRECT_URL = nil
    DEFAULT_ENDPOINT = 'https://api.runkeeper.com'.freeze
    DEFAULT_ADAPTER = :net_http
    DEFAULT_FARADAY_OPTIONS = {}.freeze
    DEFAULT_ACCEPT_HEADERS = {
      user: 'application/vnd.com.runkeeper.User+json',
      fitness_activity_feed: 'application/vnd.com.runkeeper.FitnessActivityFeed+json',
      fitness_activity: 'application/vnd.com.runkeeper.FitnessActivity+json',
      new_fitness_activity: 'application/vnd.com.runkeeper.NewFitnessActivity+json',
      strength_training_activity_feed: 'application/vnd.com.runkeeper.StrengthTrainingActivityFeed+json',
      strength_training_activity: 'application/vnd.com.runkeeper.StrengthTrainingActivity+json',
      background_activity_feed: 'application/vnd.com.runkeeper.BackgroundActivityFeed+json',
      background_activity: 'application/vnd.com.runkeeper.BackgroundActivity+json',
      sleep_feed: 'application/vnd.com.runkeeper.SleepFeed+json',
      sleep: 'application/vnd.com.runkeeper.Sleep+json',
      nutrition_feed: 'application/vnd.com.runkeeper.NutritionFeed+json',
      nutrition: 'application/vnd.com.runkeeper.Nutrition+json',
      weight_feed: 'application/vnd.com.runkeeper.WeightFeed+json',
      weight: 'application/vnd.com.runkeeper.Weight+json',
      general_measurement_feed: 'application/vnd.com.runkeeper.GeneralMeasurementFeed+json',
      general_measurement: 'application/vnd.com.runkeeper.GeneralMeasurement+json',
      diabetes_feed: 'application/vnd.com.runkeeper.DiabetesFeed+json',
      diatetes_measurement: 'application/vnd.com.runkeeper.DiabetesMeasurement+json',
      records: 'application/vnd.com.runkeeper.Records+json',
      profile: 'application/vnd.com.runkeeper.Profile+json',
      settings: 'application/vnd.com.runkeeper.Settings+json'
    }.freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end

    def reset
      self.client_id = DEFAULT_CLIENT_ID
      self.client_secret = DEFAULT_CLIENT_SECRET
      self.authorization_url = DEFAULT_AUTHORIZATION_URL
      self.access_token_url = DEFAULT_ACCESS_TOKEN_URL
      self.authorization_redirect_url = DEFAULT_AUTHORIZATION_REDIRECT_URL
      self.endpoint = DEFAULT_ENDPOINT
      self.adapter = DEFAULT_ADAPTER
      self.faraday_options = DEFAULT_FARADAY_OPTIONS
      self.accept_headers = DEFAULT_ACCEPT_HEADERS
      self
    end
  end
end
