require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
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
end
