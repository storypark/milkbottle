module Milkbottle
  module Configurable
    attr_reader :api_key, :connection_options, :user_agent
    attr_writer :api_endpoint

    class << self

      def keys
        @keys ||= [
          :api_endpoint,
          :api_key,
          :connection_options,
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

    private

    def options
      Hash[Milkbottle::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
