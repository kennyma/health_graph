require 'helper'

class TestWeightFeed < Test::Unit::TestCase   
    context "weight" do 
      setup do
        stub_request(:get, HealthGraph.endpoint + '/user'
          ).with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user]}
          ).to_return(:body => fixture('user_get.json'))

        stub_request(:get, HealthGraph.endpoint + '/weight'
          ).with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:weight_feed]}
          ).to_return(:body => fixture('weight_feed_get.json'))

        @user = HealthGraph::User.new(TEST_USER_TOKEN)
      end
      
      should "make request to api" do       
        weight = @user.weight
        assert_requested :get,  HealthGraph.endpoint + '/user', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user]}, :times => 1
        assert_requested :get,  HealthGraph.endpoint + '/weight', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:weight_feed]}, :times => 1
      end
      
      should "get body" do
        expected = {
          "items"=>[{
            "timestamp"=>"Mon, 10 Oct 2011 01:31:47",
            "weight"=>63.502931853253,
            "uri"=>"/weight/6626834"
          }],
          "size"=>1
        }

        assert_equal expected, @user.weight.body  
      end   
      
      context "item" do
        should "get one item" do
          assert_equal 1, @user.weight.items.size
        end              

        should "get timestamp" do
          assert_equal DateTime.new(2011, 10, 10, 1, 31, 47), @user.weight.items[0].timestamp
        end

        should "get weight" do
          assert_equal 63.502931853253, @user.weight.items[0].weight
        end

        should "get uri" do
          assert_equal "/weight/6626834", @user.weight.items[0].uri
        end
      end
    end    
end