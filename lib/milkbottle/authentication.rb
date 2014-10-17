module Milkbottle
  module Authentication
    def authenticated?
      token_authenticated? || app_authenticated?
    end

    def anonymous_authenticated?
      !!@anonymous_token
    end

    def token_authenticated?
      !!@jwt_token
    end

    def app_authenticated?
      !!@api_key
    end

    def external_authentication_available?
      !!@external_auth_issuer && !!@external_auth_key
    end

    def ensure_external_auth!
      throw "Please set external_auth_key and/or external_auth_issuer" unless external_authentication_available?
    end
  end
end
