require 'helper'

class TestProfile < Test::Unit::TestCase
  context 'profile' do
    setup do
      stub_request(:get, HealthGraph.endpoint + '/user').with(header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user] }).to_return(body: fixture('user_get.json'))

      stub_request(:get, HealthGraph.endpoint + '/profile').with(header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:profile] }).to_return(body: fixture('profile_get.json'))

      @user = HealthGraph::User.new(TEST_USER_TOKEN)
    end

    should 'make request to api' do
      profile = @user.profile
      assert_requested :get,  HealthGraph.endpoint + '/user', header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:user] }, times: 1
      assert_requested :get,  HealthGraph.endpoint + '/profile', header: { 'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:profile] }, times: 1
    end

    should 'get body' do
      expected = { 'location' => 'San Francisco, CA, USA',
                   'name' => 'Kenny Ma',
                   'elite' => 'true',
                   'gender' => 'M',
                   'athlete_type' => 'Runner',
                   'profile' => 'http://runkeeper.com/user/kennyma' }

      assert_equal expected, @user.profile.body
    end

    should 'get location' do
      assert_equal 'San Francisco, CA, USA', @user.profile.location
    end

    should 'get name' do
      assert_equal 'Kenny Ma', @user.profile.name
    end

    should 'get elite' do
      assert_equal true, @user.profile.elite?
    end

    should 'get gender' do
      assert_equal 'M', @user.profile.gender
    end

    should 'get authlete type' do
      assert_equal 'Runner', @user.profile.athlete_type
    end

    should 'get profile url' do
      assert_equal 'http://runkeeper.com/user/kennyma', @user.profile.profile
    end
  end
end
