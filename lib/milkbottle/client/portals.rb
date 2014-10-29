module Milkbottle
  class Client
    module Portals
      def portal(options = {})
        get("/portal", options)
      end
    end
  end
end
