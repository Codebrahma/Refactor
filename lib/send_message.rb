require "bundler"
Bundler.setup

require "json"
require "thread"
require "httpclient"
require "socket"
require 'push_daemon'
require 'worker'
require 'udp_server'
require 'udp_response'
require 'jobs/job'
require 'jobs/ping'
require 'jobs/send'


PushDaemon.new.start