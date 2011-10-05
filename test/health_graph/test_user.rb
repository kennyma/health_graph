require 'helper'
require 'health_graph/user'

class TestUser < Test::Unit::TestCase
  context "user" do
    should "get body" do
      user = HealthGraph::User.new("b9aaf2581480432a939a72f8ae72b9f5")
      assert_equal "asdf", user.body
    end
  end
end