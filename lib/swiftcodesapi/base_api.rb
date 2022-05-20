# frozen_string_literal: true

module Swiftcodesapi
  class BaseApi
    API_URL = "/v1"

    def self.request(uri, method = "POST", payload = nil)
      client = initialize_client

      response = client.send(method.downcase.to_sym) do |request|
        request.headers["x-api-key"] = Swiftcodesapi.config.api_key
        request.url("#{API_URL}#{uri}")
        request.body = payload
      end

      raise Swiftcodesapi::ResponseError, response.body if response.status != 200

      JSON.parse(response.body)
    end

    def self.initialize_client
      Faraday.new(url: Swiftcodesapi.config.api_url) do |faraday|
        faraday.request :json

        faraday.adapter Faraday.default_adapter
      end
    end

    def self.get(path)
      request(path, "GET")
    end

    def self.post(path, payload)
      request(path, "POST", payload)
    end

    def self.delete(path)
      request(path, "DELETE")
    end

    def self.put(path, payload)
      request(path, "PUT", payload)
    end
  end
end
