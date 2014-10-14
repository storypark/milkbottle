#test/test_helper.rb
require './lib/milkbottle'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.filter_sensitive_data('<MILKBOTTLE_API_KEY>') { test_milkbottle_api_key }
end

def test_milkbottle_api_key
  ENV.fetch 'MILKBOTTLE_API_KEY', 'x' * 40
end

def test_client
  Milkbottle::Client.new(api_key: test_milkbottle_api_key)
end
