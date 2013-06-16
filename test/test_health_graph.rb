require 'helper'

class TestHealthGraph < Test::Unit::TestCase
  context "Health Graph" do
    setup do
      HealthGraph.reset
    end

    should "get default client id" do
      assert_equal nil, HealthGraph.client_id
    end

    should "set client id" do
      client_id = "123456asdb"
      HealthGraph.client_id = client_id
      assert_equal client_id, HealthGraph.client_id
    end

    should "get default client secret" do
      assert_equal nil, HealthGraph.client_secret
    end

    should "set client secret" do
      secret = "supersecret"
      HealthGraph.client_secret = secret
      assert_equal secret, HealthGraph.client_secret
    end

    should "get default authorization url" do
      assert_equal "https://runkeeper.com/apps/authorize", HealthGraph.authorization_url
    end

    should "set authorization url" do
      url = "http://somesite.com/apps/authorize"
      HealthGraph.authorization_url = url
      assert_equal url, HealthGraph.authorization_url
    end

    should "get default access token url" do
      assert_equal "https://runkeeper.com/apps/token", HealthGraph.access_token_url
    end

    should "set access token url" do
      url = "http://somesite.com/apps/token"
      HealthGraph.access_token_url = url
      assert_equal url, HealthGraph.access_token_url
    end

    should "get default authorization redirect url" do
      assert_equal nil, HealthGraph.authorization_redirect_url
    end

    should "set authorization redirect url" do
      url = "http://somesite.com/runkeeper"
      HealthGraph.authorization_redirect_url = url
      assert_equal url, HealthGraph.authorization_redirect_url
    end

    should "get default api endpoint" do
      assert_equal "https://api.runkeeper.com", HealthGraph.endpoint
    end

    should "set api endpoont" do
      new_endpoint = "https://api.somesite.com"
      HealthGraph.endpoint = new_endpoint
      assert_equal new_endpoint, HealthGraph.endpoint
    end

    should "get default adapter" do
      assert_equal :net_http, HealthGraph.adapter
    end

    should "set adapter" do
      adapter = :typhoeus
      HealthGraph.adapter = adapter
      assert_equal adapter, HealthGraph.adapter
    end

    should "get default faraday options" do
      assert HealthGraph.faraday_options.empty?, "Expected empty hash but got #{HealthGraph.faraday_options.inspect}"
    end

    should "set faraday options" do
      options = {:new_option => "testing option", :another => "another option"}
      HealthGraph.faraday_options = options
      assert_equal options, HealthGraph.faraday_options
    end

    should "get default accept headers" do
      options = {
        :user => "application/vnd.com.runkeeper.User+json",
        :fitness_activity_feed => "application/vnd.com.runkeeper.FitnessActivityFeed+json",
        :fitness_activity => "application/vnd.com.runkeeper.FitnessActivity+json",
        :new_fitness_activity => "application/vnd.com.runkeeper.NewFitnessActivity+json",
        :strength_training_activity_feed => "application/vnd.com.runkeeper.StrengthTrainingActivityFeed+json",
        :strength_training_activity => "application/vnd.com.runkeeper.StrengthTrainingActivity+json",
        :background_activity_feed => "application/vnd.com.runkeeper.BackgroundActivityFeed+json",
        :background_activity => "application/vnd.com.runkeeper.BackgroundActivity+json",
        :sleep_feed => "application/vnd.com.runkeeper.SleepFeed+json",
        :sleep => "application/vnd.com.runkeeper.Sleep+json",
        :nutrition_feed => "application/vnd.com.runkeeper.NutritionFeed+json",
        :nutrition => "application/vnd.com.runkeeper.Nutrition+json",
        :weight_feed => "application/vnd.com.runkeeper.WeightFeed+json",
        :weight => "application/vnd.com.runkeeper.Weight+json",
        :general_measurement_feed => "application/vnd.com.runkeeper.GeneralMeasurementFeed+json",
        :general_measurement => "application/vnd.com.runkeeper.GeneralMeasurement+json",
        :diabetes_feed => "application/vnd.com.runkeeper.DiabetesFeed+json",
        :diatetes_measurement => "application/vnd.com.runkeeper.DiabetesMeasurement+json",
        :records => "application/vnd.com.runkeeper.Records+json",
        :profile => "application/vnd.com.runkeeper.Profile+json",
        :settings=>"application/vnd.com.runkeeper.Settings+json"
      }

      assert_equal options, HealthGraph.accept_headers
    end

    should "set accept headers" do
      options = {
        :user => "application/vnd.com.runkeeper.User+json",
        :fitness_activity_feed => "application/vnd.com.runkeeper.FitnessActivityFeed+json",
      }

      HealthGraph.accept_headers = options
      assert_equal options, HealthGraph.accept_headers
    end

    context "configure" do
      HealthGraph::Configuration::VALID_OPTIONS_KEYS.each do |k|
        should "set #{k}" do
          HealthGraph.configure do |config|
            config.send("#{k}=", k)
          end
          assert_equal k, HealthGraph.send(k)
        end
      end
    end
  end
end
