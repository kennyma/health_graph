require 'simplecov'
SimpleCov.start

require 'date'
require 'test/unit'
require 'shoulda'
require 'webmock/test_unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'health_graph'

class Test::Unit::TestCase
  TEST_USER_TOKEN = "b9aaf2581480432a939a72f894bf".freeze
  
  def fixture(file)
    path = File.expand_path("../fixtures", __FILE__)
    File.new(path + '/' + file)
  end
  
  def json_fixture(file)
    file = fixture(file)
    JSON.load(file)    
  end
end
