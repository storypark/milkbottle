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

        token = Milkbottle::JwtToken.new({external_auth_issuer: external_auth_issuer, audience: audience, external_id: external_id, email: email})
        self.jwt_token = token
      end
    end
  end
end
