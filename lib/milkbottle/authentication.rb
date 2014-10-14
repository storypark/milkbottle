module Milkbottle
  module Authentication
    def authenticated?
      token_authenticated? || app_authenticated?
    end

    def token_authenticated?
      !!@jwt_token
    end

    def app_authenticated?
      !!@api_key
    end
  end
end
