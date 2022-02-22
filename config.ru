require "bundler/setup"
Bundler.require(:default)
require 'sinatra'
require 'resque/server'
require 'resque/status_server'
require 'resque/lock_server'
require 'resque/scheduler'
require 'resque/scheduler/server'
require 'yaml'

Resque.redis = Redis.new({
  :host => ENV["REDIS_HOST"] || "127.0.0.1",
  :port => ENV["REDIS_PORT"] || 6379,
  :db => ENV["REDIS_DB"] || 0
})

map "/" do
  run Resque::Server.new
end