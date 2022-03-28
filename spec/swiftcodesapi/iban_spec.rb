# frozen_string_literal: true

require "spec_helper"

RSpec.describe Swiftcodesapi::Iban do
  subject { described_class.new(response) }
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

  describe ".account_number" do
    it "returns account number" do
      expect(subject.account_number).to eq "85682088835"
    end
  end

  describe ".national_bank_code" do
    it "returns national bank code" do
      expect(subject.national_bank_code).to eq "32500"
    end
  end

  describe ".national_branch_code" do
    it "returns national branch code" do
      expect(subject.national_branch_code).to eq ""
    end
  end

  describe ".country_iso2" do
    it "returns country iso 2 code" do
      expect(subject.country_iso2).to eq "LT"
    end
  end

  describe ".swift_id" do
    it "returns swift code" do
      expect(subject.swift_id).to eq "REVOLT21XXX"
    end
  end

  describe ".swift_address" do
    it "returns bank address" do
      expect(subject.swift_address).to eq "JOGALIOS STREET 9"
    end
  end

  describe ".swift_postcode" do
    it "returns bank postcode" do
      expect(subject.swift_postcode).to eq "01116"
    end
  end

  describe ".swift_branch_name" do
    it "returns bank branch name" do
      expect(subject.swift_branch_name).to eq "Primary Office"
    end
  end

  describe ".swift_branch_code" do
    it "returns bank branch code" do
      expect(subject.swift_branch_code).to eq "XXX"
    end
  end

  describe ".swift_country_iso2" do
    it "returns bank country iso 2 code" do
      expect(subject.swift_country_iso2).to eq "LT"
    end
  end

  describe ".swift_city" do
    it "returns bank city" do
      expect(subject.swift_city).to eq "Vilnius"
    end
  end

  describe ".swift_bank" do
    it "returns bank name" do
      expect(subject.swift_bank).to eq "REVOLUT PAYMENTS UAB"
    end
  end
end
