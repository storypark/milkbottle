require './test/test_helper'

class MilkbottleProductsTest < Minitest::Test
  def test_exists
    assert Milkbottle::Client::Products
  end

  def test_it_gives_back_all_the_cars
    VCR.use_cassette('all_products') do
      result = Milkbottle.products

      # Make sure we got all the products
      assert_equal 17, result.length

      # Make sure that the JSON was parsed
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Milkbottle::Client::Product)
    end
  end
end
