require "milkbottle/client"
require "milkbottle/default"

module Milkbottle
  class << self
    include Milkbottle::Configurable


    def client
      @client = Milkbottle::Client.new(options) unless defined?(@client) && @client.same_options?(options)
      @client
    end
  end
end

Milkbottle.setup
