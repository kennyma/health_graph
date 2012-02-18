require 'helper'

class TestNewFitnessActivity < Test::Unit::TestCase  
    context "New Fitness Activity" do 
      setup do
        stub_request(:post, HealthGraph.endpoint + '/fitnessActivities')
        .with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:new_fitness_activity]})
        .to_return(:status => 201, :headers => {'location' => '/fitnessActivities/20'})
      end
      
      should "make request to api" do
         activity = HealthGraph::NewFitnessActivity.new(TEST_USER_TOKEN, json_fixture('new_fitness_activity_params.json'))
          assert_requested :post,  HealthGraph.endpoint + '/fitnessActivities', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:new_fitness_activity]}, :times => 1
      end
      
      should "get location" do
        activity = HealthGraph::NewFitnessActivity.new(TEST_USER_TOKEN, json_fixture('new_fitness_activity_params.json'))            
        assert_equal '/fitnessActivities/20', activity.location    
      end 
      
      should "get success status" do
        activity = HealthGraph::NewFitnessActivity.new(TEST_USER_TOKEN, json_fixture('new_fitness_activity_params.json'))    
        assert_equal 201, activity.status  
      end            
    end    
end