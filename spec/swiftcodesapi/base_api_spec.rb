# frozen_string_literal: true

require "spec_helper"

RSpec.describe Swiftcodesapi::BaseApi do
  describe ".request" do
    subject { described_class.request("/url", "POST", data: []) }
    it "sends request to swifcodesapi" do
      stub_request(:post, "https://swiftcodesapi.com/v1/url")
        .with(
          body: '{"data":[]}',
          headers: {
            "x-api-key" => "3243434",
            "Content-Type" => "application/json",
          }
        ).and_return(body: '{ "errors": [], "success": true }')
      expect(subject["success"]).to be_truthy
    end
  end
end
