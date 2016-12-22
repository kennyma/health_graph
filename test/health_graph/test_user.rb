require 'helper'

class TestUser < Test::Unit::TestCase
  context 'user' do
    setup do
      stub_request(:get, HealthGraph.endpoint + '/user').with(header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user] }).to_return(body: fixture('user_get.json'))
    end

    should 'make request to api' do
      user = HealthGraph::User.new(TEST_USER_TOKEN)
      assert_requested :get, HealthGraph.endpoint + '/user', header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user] }, times: 1
    end

    should 'get body' do
      expected = { 'strength_training_activities' => '/strengthTrainingActivities',
                   'weight' => '/weight',
                   'settings' => '/settings',
                   'diabetes' => '/diabetes',
                   'team' => '/team',
                   'sleep' => '/sleep',
                   'fitness_activities' => '/fitnessActivities',
                   'userID' => 5_568_845,
                   'nutrition' => '/nutrition',
                   'general_measurements' => '/generalMeasurements',
                   'background_activities' => '/backgroundActivities',
                   'records' => '/records',
                   'profile' => '/profile' }

      user = HealthGraph::User.new(TEST_USER_TOKEN)
      assert_equal expected, user.body
    end

    should 'get user id' do
      user = HealthGraph::User.new(TEST_USER_TOKEN)
      assert_equal 5_568_845, user.userID
    end
  end
end
