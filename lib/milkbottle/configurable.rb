module Milkbottle
  module Configurable
    attr_reader :anonymous_token,
                :api_key,
                :connection_options,
                :expiry_in_hours,
                :external_auth_issuer,
                :external_auth_key,
                :jwt_token,
                :user_agent

    attr_writer :api_endpoint


    class << self

      def keys
        @keys ||= [
          :anonymous_token,
          :api_endpoint,
          :api_key,
          :connection_options,
          :expiry_in_hours,
          :external_auth_issuer,
          :external_auth_key,
          :jwt_token,
          :user_agent
        ]
      end
    end

    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      Milkbottle::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Milkbottle::Default.options[key])
      end
      self
    end
    alias setup reset!

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    def audience
      URI(@api_endpoint).host
    end

    private

    def options
      Hash[Milkbottle::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
