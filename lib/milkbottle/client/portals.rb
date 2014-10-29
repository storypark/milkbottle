module Milkbottle
  class Client
    module Portals
      def portal(options = {})
        post("/portal", options)
      end
    end
  end
end
