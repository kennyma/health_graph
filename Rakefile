# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "health_graph"
  gem.homepage = "http://github.com/kennyma/health_graph"
  gem.license = "MIT"
  gem.summary = "Ruby gem for RunKeeper Health Graph API"
  gem.description = "This is a wrapper for RunKeeper Health Graph RESTful API."
  gem.email = "kenny@kennyma.me"
  gem.authors = ["Kenny Ma"]
  # dependencies defined in Gemfile
  gem.add_dependency 'oauth2', '= 0.5.2'
  gem.add_dependency 'faraday', '= 0.7.4'
  gem.add_dependency 'faraday_middleware', '= 0.7.0'
  gem.add_dependency 'hashie', '= 1.2'
  gem.add_dependency 'webmock', '= 1.7.6'
  gem.add_dependency 'json'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "health_graph #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
