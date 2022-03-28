# frozen_string_literal: true

require "faraday"

require_relative "swiftcodesapi/error"
require_relative "swiftcodesapi/version"
require_relative "swiftcodesapi/configuration"
require_relative "swiftcodesapi/base_api"
require_relative "swiftcodesapi/iban"
require_relative "swiftcodesapi/ibans"

module Swiftcodesapi
  @configuration = Configuration.new

  def self.config
    @configuration
  end

  def self.configure
    yield(@configuration)
  end
end
