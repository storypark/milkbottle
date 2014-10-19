require './test/test_helper'

class JwtTokenTest < Minitest::Test
  def setup
    Milkbottle.reset!
  end

  def teardown
    Milkbottle.reset!
  end

  def test_it_sets_expiry
    token = Milkbottle::JwtToken.new
    assert_equal token.expiry, token.expiry
  end

  def test_it_creates_a_milkbottle_client
    assert_equal Milkbottle.client.class, Milkbottle::Client
  end

  def test_it_caches_milkbottle_clients
    assert_equal Milkbottle.client, Milkbottle.client
  end
end
