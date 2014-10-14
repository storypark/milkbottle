require './test/test_helper'

class MilkbottleTokensTest < Minitest::Test
  def setup
    Milkbottle.reset!
    @client = test_client
  end

  def teardown
    Milkbottle.reset!
  end

  def test_exists
    assert Milkbottle::Client::Tokens
  end

  def test_it_creates_an_internal_user_token
    VCR.use_cassette('create_internal_user_token') do
      result = @client.create_internal_user_token('user@example.com', 'password')
      assert !result.nil?
    end
  end
end
