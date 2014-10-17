require 'milkbottle/version'

module Milkbottle
  module Default
    API_ENDPOINT    = "https://api.staging.milkbooks.com".freeze

    EXPIRY_IN_HOURS = 24

    MEDIA_TYPE      = "application/json"

    MIDDLEWARE      = Faraday::RackBuilder.new do |builder|
      builder.adapter Faraday.default_adapter
    end

    USER_AGENT      = "Milkbottle Ruby Gem #{Milkbottle::VERSION}".freeze

    class << self

      # Configuration options
      # @return [Hash]
      def options
        Hash[Milkbottle::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default access token from ENV
      # @return [String]
      def api_key
        ENV['MILKBOTTLE_API_KEY']
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['MILKBOTTLE_API_ENDPOINT'] || API_ENDPOINT
      end

      def anonymous_token
        ENV['MILKBOTTLE_ANONYMOUS_TOKEN']
      end

      def jwt_token
        ENV['MILKBOTTLE_JWT_TOKEN']
      end

      def connection_options
        {
          :headers => {
            :accept => default_media_type,
            :user_agent => user_agent
          }
        }
      end

      def default_media_type
        ENV['MILKBOTTLE_MEDIA_TYPE'] || MEDIA_TYPE
      end

      def expiry_in_hours
        ENV['MILKBOTTLE_EXPIRY_IN_HOURS'] || EXPIRY_IN_HOURS
      end

      def external_auth_key
        ENV['MILKBOTTLE_EXTERNAL_AUTH_KEY']
      end

      def external_auth_issuer
        ENV['MILKBOTTLE_EXTERNAL_AUTH_ISSUER']
      end

      def middleware
        MIDDLEWARE
      end

      def user_agent
        ENV['MILKBOTTLE_USER_AGENT'] || USER_AGENT
      end
    end
  end
end
