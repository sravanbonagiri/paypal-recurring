require "spec_helper"

describe PayPalr::Recurring::Response do
  let(:response_class) { Class.new(PayPalr::Recurring::Response::Base) }

  describe ".mapping" do
    it "returns single item mapping" do
      response_class.mapping :foo => :bar
      response = response_class.new(stub(:body => "bar=foo"))
      response.foo.should == "foo"
    end

    it "returns item from array mapping" do
      response_class.mapping :foo => [:bar, :zaz]
      response = response_class.new(stub(:body => "zaz=foo"))
      response.foo.should == "foo"
    end
  end
end
