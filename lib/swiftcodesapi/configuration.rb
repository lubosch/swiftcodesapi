# frozen_string_literal: true

module Swiftcodesapi
  class Configuration
    attr_accessor :api_key, :api_url

    def initialize
      @api_key = ENV["SWIFTCODESAPI_API_KEY"]
      @api_url = ENV["SWIFTCODESAPI_API_URL"] || "https://swiftcodesapi.com"
    end
  end
end
