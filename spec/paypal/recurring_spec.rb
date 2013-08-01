require "spec_helper"

describe PayPalr::Recurring do
  describe ".new" do
    it "instantiates PayPalr::Recurring::Base" do
      PayPalr::Recurring.new.should be_a(PayPalr::Recurring::Base)
    end
  end

  describe ".version" do
    it "returns PayPalr's API version" do
      PayPalr::Recurring.api_version.should eq("72.0")
    end
  end

  describe ".configure" do
    it "yields PayPalr::Recurring" do
      PayPalr::Recurring.configure do |config|
        config.should be(PayPalr::Recurring)
      end
    end

    it "sets attributes" do
      PayPalr::Recurring.configure do |config|
        config.sandbox = false
      end

      PayPalr::Recurring.sandbox.should be_false
    end
  end

  describe ".sandbox?" do
    it "detects sandbox" do
      PayPalr::Recurring.sandbox = true
      PayPalr::Recurring.should be_sandbox
    end

    it "ignores sandbox" do
      PayPalr::Recurring.sandbox = false
      PayPalr::Recurring.should_not be_sandbox
    end
  end

  describe ".environment" do
    it "returns production" do
      PayPalr::Recurring.sandbox = false
      PayPalr::Recurring.environment.should eq(:production)
    end

    it "returns sandbox" do
      PayPalr::Recurring.sandbox = true
      PayPalr::Recurring.environment.should eq(:sandbox)
    end
  end

  describe ".api_endpoint" do
    it "returns url" do
      PayPalr::Recurring.api_endpoint.should_not be_nil
      PayPalr::Recurring.api_endpoint.should == PayPalr::Recurring.endpoints[:api]
    end
  end

  describe ".site_endpoint" do
    it "returns url" do
      PayPalr::Recurring.site_endpoint.should_not be_nil
      PayPalr::Recurring.site_endpoint.should == PayPalr::Recurring.endpoints[:site]
    end
  end

  describe ".endpoints" do
    it "returns production's" do
      PayPalr::Recurring.sandbox = false
      PayPalr::Recurring.endpoints.should eq(PayPalr::Recurring::ENDPOINTS[:production])
    end

    it "returns sandbox's" do
      PayPalr::Recurring.sandbox = true
      PayPalr::Recurring.endpoints.should eq(PayPalr::Recurring::ENDPOINTS[:sandbox])
    end
  end
end
