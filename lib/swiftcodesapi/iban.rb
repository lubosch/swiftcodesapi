# frozen_string_literal: true

module Swiftcodesapi
  class Iban
    attr_reader :data, :id, :account_number, :national_bank_code, :national_branch_code, :swift, :country_iso2

    def initialize(response)
      @data = response["data"]
      @id = data["id"]
      @account_number = data["account_number"]
      @national_bank_code = data["national_bank_code"]
      @national_branch_code = data["national_branch_code"]
      @swift = data["swift"]
      @country_iso2 = data.dig("country", "id")
    end

    def swift_id
      swift_data? && swift["id"]
    end

    def swift_address
      swift_data? && swift["address"]
    end

    def swift_postcode
      swift_data? && swift["postcode"]
    end

    def swift_branch_name
      swift_data? && swift["branch_name"]
    end

    def swift_branch_code
      swift_data? && swift["branch_code"]
    end

    def swift_country_iso2
      swift_data? && swift.dig("country", "id")
    end

    def swift_city
      swift_data? && swift.dig("city", "name")
    end

    def swift_bank
      swift_data? && swift.dig("bank", "name")
    end

    protected

    def swift_data?
      swift&.count&.positive?
    end
  end
end
