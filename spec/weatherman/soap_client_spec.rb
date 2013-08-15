require_relative '../spec_helper'

describe Weatherman do
  describe "SOAPClient" do

    before(:each) do
    end

    it "should initialize the client properly" do
      soap_client = Weatherman::SOAPClient.new
      soap_client.should_not be_nil
    end

    it "should get the SOAP operations" do
      soap_client = Weatherman::SOAPClient.new
      soap_client.get_operations.size.should == 2
    end

    it "should handle exception properly" do
      Savon.stub(:client).and_raise(Exception)
      lambda { Weatherman::SOAPClient.new }.should raise_error(WeathermanException)
    end
    
  end
end

