require './test/test_helper'

class MilkbottleTest < Minitest::Test
  def setup
    Milkbottle.reset!
  end

  def test_it_sets_defaults
    Milkbottle::Configurable.keys.each do |key|
      assert_equal(Milkbottle.instance_variable_get(:"@#{key}"), Milkbottle::Default.send(key))
    end
  end

  def test_it_creates_a_milkbottle_client
    assert_equal Milkbottle.client.class, Milkbottle::Client
  end

  def test_it_caches_milkbottle_clients
    assert_equal Milkbottle.client, Milkbottle.client
  end

  def teardown
    Milkbottle.reset!
  end
end
