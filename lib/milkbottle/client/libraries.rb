module Milkbottle
  class Client
    module Libraries
      def create_library_multi_pull(urls, options = {})
        post "/library/multi/pull", options.merge({Urls: [*urls]})
      end

      def create_library_pull(url, options = {})
        post "/library/pull", options.merge({Url: url})
      end
    end
  end
end
