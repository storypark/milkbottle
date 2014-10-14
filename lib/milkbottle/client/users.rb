module Milkbottle
  class Client
    module Users
      def users(options = {})
        get "users", options
      end

      def create_anonymous_user(options)
        post "users/anonymous", options
      end
    end
  end
end
