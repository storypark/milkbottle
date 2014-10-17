#test/test_helper.rb
require './lib/milkbottle'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
  c.filter_sensitive_data('<MILKBOTTLE_API_KEY>')              { test_milkbottle_api_key }
  c.filter_sensitive_data('<MILKBOTTLE_EXTERNAL_AUTH_KEY>')    { test_milkbottle_external_auth_key }
  c.filter_sensitive_data('<MILKBOTTLE_EXTERNAL_AUTH_ISSUER>') { test_milkbottle_external_auth_issuer }
end

def test_milkbottle_api_key
  ENV.fetch 'MILKBOTTLE_API_KEY', 'x' * 40
end

def test_milkbottle_external_auth_key
  ENV.fetch 'MILKBOTTLE_EXTERNAL_AUTH_KEY', 'x' * 40
end

def test_milkbottle_external_auth_issuer
  ENV.fetch 'MILKBOTTLE_EXTERNAL_AUTH_ISSUER', 'example.com'
end

def test_client
  Milkbottle::Client.new(api_key: test_milkbottle_api_key, external_auth_issuer: test_milkbottle_external_auth_issuer)
end
