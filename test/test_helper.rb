require 'test/unit'
require 'rubygems'
require 'context'
require 'fake_web'

FakeWeb.allow_net_connect = false

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib') )
require 'github-party'
