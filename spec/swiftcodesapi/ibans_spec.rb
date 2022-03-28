# frozen_string_literal: true

require "spec_helper"

RSpec.describe Swiftcodesapi::Ibans do
  describe ".find_by_iban" do
    subject { described_class.find_by_iban("LT933250085682088835") }
    let(:response) do
      {
        "success" => true,
        "data" => {
          "id" => "LT933250085682088835",
          "account_number" => "85682088835",
          "national_bank_code" => "32500",
          "national_branch_code" => "",
          "swift" => {
            "id" => "REVOLT21XXX",
            "address" => "JOGALIOS STREET 9",
            "postcode" => "01116",
            "branch_name" => "Primary Office",
            "branch_code" => "XXX",
            "country" => {
              "id" => "LT",
              "name" => "Lithuania",
            },
            "city" => {
              "id" => "72725e2e-90b6-4c94-a380-d3bf430fd064",
              "country_id" => "LT",
              "name" => "Vilnius",
            },
            "bank" => {
              "id" => "a3f41062-bb4a-459f-9e55-9ea87a22c41f",
              "country_id" => "LT",
              "code" => "REVO",
              "name" => "REVOLUT PAYMENTS UAB",
            },
          },
          "country" => {
            "id" => "LT",
            "name" => "Lithuania",
          },
        },
      }
    end

    it "sends request to swiftcodesapi" do
      stub_request(:get, "https://swiftcodesapi.com/v1/ibans/LT933250085682088835")
        .to_return(body: response.to_json)

      expect(subject).to have_attributes(swift_id: "REVOLT21XXX")
    end
  end
end
