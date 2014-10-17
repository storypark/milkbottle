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

      def generate_external_user_token(issuer, audience, external_id, email)
        JWT.encode({iss: :issuer, aud: audience, exp: Time.now + expiry_in_hours, sub: external_id, email: email}, "secret")
      end
    end
  end
end
