require './test/test_helper'

class MilkbottleLibrariesTest < Minitest::Test
  def setup
    Milkbottle.reset!
    @client = test_client
  end

  def teardown
    Milkbottle.reset!
  end

  def test_exists
    assert Milkbottle::Client::Libraries
  end

  def test_it_creates_a_library_through_multi_pull
    VCR.use_cassette('create_library_multi_pull') do
      result = @client.create_library_multi_pull('http://www.robertshadbolt.com/content/01-articles/01-900x900/900x900.gif')
      assert !result.nil?
    end
  end
end
