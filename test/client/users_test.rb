require './test/test_helper'

class MilkbottleUsersTest < Minitest::Test
  def setup
    Milkbottle.reset!
    @client = test_client
  end

  def teardown
    Milkbottle.reset!
  end

  def test_exists
    assert Milkbottle::Client::Users
  end

  def test_it_creates_an_anonymous_user
    VCR.use_cassette('create_anonymous_user') do
      result = @client.create_anonymous_user
      assert !result.nil?
    end
  end

  def test_it_creates_an_internal_user
    # VCR.use_cassette('create_internal_user') do
    #   result = @client.create_internal_user('test@example.com', 'password')
    #   assert !result.nil?
    # end
  end

  def test_it_generates_an_external_user_token
    result = @client.generate_external_user_token('external_id', 'email')
    assert !result.nil?
    assert_equal result, @client.jwt_token
  end
end
