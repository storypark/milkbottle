module Milkbottle
  class Client
    module Tokens
      def create_internal_user_token(email, password, options = {})
        post "/token", options.merge({EmailAddress: email, Password: password})
      end
    end
  end
end
