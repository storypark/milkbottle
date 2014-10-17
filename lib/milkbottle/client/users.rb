require 'jwt'
module Milkbottle
  class Client
    module Users
      def create_anonymous_user(options = {})
        post("/user/anonymous", options)
      end

      def create_internal_user(email, password, external_id = nil, options = {})
        post("/user", options.merge({EmailAddress: email, Password: password, ExternalUserId: external_id}))
      end

      def generate_external_user_token(external_id, email)
        ensure_external_auth!

        self.jwt_token = JWT.encode({iss: external_auth_issuer, aud: audience, exp: Time.now + expiry_in_hours, sub: external_id, email: email}, external_auth_key)
      end
    end
  end
end
