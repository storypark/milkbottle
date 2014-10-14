module Milkbottle
  class Client
    module Products
      def products(options = {})
        get("/products", options)['Products']
      end
    end
  end
end
