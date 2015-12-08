require "bundler/setup"
Bundler.require(:default)
require 'sinatra'
require 'resque/server'
require 'resque/status_server'
require 'resque/lock_server'
require 'resque/scheduler'
require 'resque/scheduler/server'
require 'yaml'

# Resque.redis = Redis.new
# Or, with custom options
Resque.redis = Redis.new({
  :host => "127.0.0.1",
  :port => 6379,
  :db => 0
})

run Rack::URLMap.new "/" => Resque::Server.new
