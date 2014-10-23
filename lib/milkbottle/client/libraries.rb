module Milkbottle
  class Client
    module Libraries
      def create_library_pull(url, options = {})
        post "/library/pull", options.merge({Url: url})
      end

      def create_library_multi_pull(urls, options = {})
        post "/library/multi/pull", options.merge({Urls: [*urls]})
      end

      def create_product_builder(library_ids, options ={})
        post "/library/builder", options.merge({Guids: library_ids})
      end
    end
  end
end
