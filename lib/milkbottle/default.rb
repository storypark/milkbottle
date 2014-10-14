require 'milkbottle/version'

module Milkbottle
  module Default
    API_ENDPOINT = "https://api.staging.milkbooks.com".freeze

    USER_AGENT   = "Milkbottle Ruby Gem #{Milkbottle::VERSION}".freeze

    MEDIA_TYPE   = "application/json"

    MIDDLEWARE = Faraday::RackBuilder.new do |builder|
      builder.adapter Faraday.default_adapter
    end
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

      def middleware
        MIDDLEWARE
      end

      def user_agent
        ENV['MILKBOTTLE_USER_AGENT'] || USER_AGENT
      end
    end
  end
end
