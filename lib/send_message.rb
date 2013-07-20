require "bundler"
Bundler.setup

require "json"
require "thread"
require "httpclient"
require "socket"
require 'push_daemon'
require 'worker'
require 'udp_server'


PushDaemon.new.start