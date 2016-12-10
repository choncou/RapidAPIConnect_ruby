require 'net/http'
require 'json'
require 'rapid_api/version'
require 'rapid_api/config'

module RapidAPI
  class << self
    def config(**args)
      RapidAPI::Config.setup(args)
    end

    def call(package_name, block_name, args={})
      # Create URI
      uri = build_uri(package_name, block_name)

      req = build_request(uri, args)

      # Execute
      res = Net::HTTP.start(uri.hostname, uri.port) { |http|
        http.request(req)
      }

      # Jsonify
      reply = JSON.parse(res.body)

      # Check for request errors
      unless res.code.to_i == 200
        reply['outcome'] = 'error'
        reply['payload'] = 'Networking error'
      end

      # Return result
      reply
    end

    def build_uri(package, block)
      URI("http://rapidapi.io/connect/#{package}/#{block}")
    end

    def build_request(uri, form_data)
      config = RapidAPI::Config

      # Create request
      req = Net::HTTP::Post.new(uri)

      # Set project credentials
      req.basic_auth(config.project, config.api_key)

      # Add arguments
      req.set_form_data(form_data)

      req
    end
  end
end
