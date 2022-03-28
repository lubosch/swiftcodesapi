# frozen_string_literal: true

module Swiftcodesapi
  class Ibans < BaseApi
    URL = "/ibans"

    def self.find_by_iban(iban)
      response = get("#{URL}/#{iban}")
      raise IbanError, response["data"] unless response["success"]

      Swiftcodesapi::Iban.new(response)
    end

    class IbanError < Swiftcodesapi::Error
    end
  end
end
