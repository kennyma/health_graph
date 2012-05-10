require 'helper'

class TestSleepFeed < Test::Unit::TestCase   
    context "sleep" do 
      setup do
        stub_request(:get, HealthGraph.endpoint + '/user'
          ).with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user]}
          ).to_return(:body => fixture('user_get.json'))

        stub_request(:get, HealthGraph.endpoint + '/sleep'
          ).with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:sleep_feed]}
          ).to_return(:body => fixture('sleep_feed_get.json'))

        @user = HealthGraph::User.new(TEST_USER_TOKEN)
      end
      
      should "make request to api" do       
        sleep = @user.sleep
        assert_requested :get,  HealthGraph.endpoint + '/user', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user]}, :times => 1
        assert_requested :get,  HealthGraph.endpoint + '/sleep', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:sleep_feed]}, :times => 1
      end
      
      should "get body" do
        expected = {
          "items" => [
            {
              "timestamp" => "Thu, 22 Sep 2011 00:00:00",
              "total_sleep" => 822,
              "uri" => "/sleep/6253947"
            }, {
              "timestamp" => "Thu, 22 Sep 2011 00:00:00",
              "uri" => "/sleep/6253948",
              "times_woken" => 29
            }
          ],
          "size" => 2
        }

        assert_equal expected, @user.sleep.body  
      end   

      context "item" do
        should "get two items" do
          assert_equal 2, @user.sleep.items.size
        end              

        should "get timestamp" do
          assert_equal DateTime.new(2011, 9, 22, 0, 0, 0), @user.sleep.items[0].timestamp
        end

        should "get total sleep" do
          assert_equal 822, @user.sleep.items[0].total_sleep
          assert_equal nil, @user.sleep.items[1].total_sleep
        end

        should "get times woken" do
          assert_equal nil, @user.sleep.items[0].times_woken
          assert_equal 29, @user.sleep.items[1].times_woken
        end

        should "get uri" do
          assert_equal "/sleep/6253947", @user.sleep.items[0].uri
        end
      end
    end    
end