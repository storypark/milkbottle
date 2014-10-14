module Milkbottle
  class Client
    module Products
      def products(options = {})
        get "products", options
      end
    end
  end
end
