module Milkbottle
  class Client
    module Users
      def create_anonymous_user(options = {})
        post("/user/anonymous", options)['Token']
      end

      def create_internal_user(email, password, external_id = nil, options = {})
        post("/user", options.merge({EmailAddress: email, Password: password, ExternalUserId: external_id}))
      end
    end
  end
end
