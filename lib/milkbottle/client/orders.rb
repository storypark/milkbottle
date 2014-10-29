module Milkbottle
  class Client
    module Orders
      def orders(options = {})
        get("/orders", options)
      end

      def order(order_id, options ={})
        get("/orders/#{order_id}", options)
      end
    end
  end
end
