require './test/test_helper'

class MilkbottleProductsTest < Minitest::Test
  def setup
    Milkbottle.reset!
    @client = test_client
  end

  def teardown
    Milkbottle.reset!
  end

  def test_exists
    assert Milkbottle::Client::Products
  end

  def test_it_gives_back_all_the_products
    VCR.use_cassette('products') do
      result = @client.products

      assert result.kind_of?(Array)

      assert_equal 17, result.length
    end
  end
end
