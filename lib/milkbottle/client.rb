require 'sawyer'
require 'milkbottle/authentication'
require 'milkbottle/configurable'
require 'milkbottle/jwt_token'
require 'milkbottle/client/libraries'
require 'milkbottle/client/products'
require 'milkbottle/client/tokens'
require 'milkbottle/client/users'

module Milkbottle
  class Client
    include Milkbottle::Authentication
    include Milkbottle::Configurable
    include Milkbottle::Client::Libraries
    include Milkbottle::Client::Products
    include Milkbottle::Client::Tokens
    include Milkbottle::Client::Users

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Milkbottle::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Milkbottle.instance_variable_get(:"@#{key}"))
      end
    end

    def same_options?(opts)
      opts.hash == options.hash
    end

    def get(url, options = {})
      request :get, url, options
    end

    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def patch(url, options = {})
      request :patch, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    def head(url, options = {})
      request :head, url, options
    end

    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:content_type] = "application/json"
        http.headers[:user_agent] = user_agent
        if token_authenticated?
          http.authorization('Bearer', @jwt_token.encode(external_auth_key))
        elsif anonymous_authenticated?
          http.authorization('Bearer', @anonymous_token)
          http.headers['X-MILK-API-KEY'] = @api_key
        elsif app_authenticated?
          http.headers['X-MILK-API-KEY'] = @api_key
        else
          throw "Please supply an api_key or jwt_token"
        end
      end
    end

    def last_response
      @last_response if defined? @last_response
    end

    def api_key=(api_key)
      reset_agent
      @api_key = api_key
    end

    def anonymous_token=(anonymous_token)
      reset_agent
      @anonymous_token = anonymous_token
    end

    def jwt_token=(jwt_token)
      reset_agent
      @jwt_token = jwt_token
    end

  private

    def reset_agent
      @agent = nil
    end

    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query]   = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end
      end

      @last_response = response = agent.call(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end

    def sawyer_options
      opts = {
        :links_parser => Sawyer::LinkParsers::Simple.new
      }
      conn_opts = @connection_options
      conn_opts[:builder] = @middleware if @middleware
      conn_opts[:proxy] = @proxy if @proxy
      conn_opts[:ssl] = {:verify => false}
      opts[:faraday] = Faraday.new(conn_opts)

      opts
    end
  end
end
