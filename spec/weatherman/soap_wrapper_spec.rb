require_relative '../spec_helper'

describe Weatherman do
  describe "SOAPWrapper" do

    before(:each) do
      soap_client = Weatherman::SOAPClient.new
      parser = Weatherman::Parser.new
      @soap_wrapper = Weatherman::SOAPWrapper.new(soap_client, parser)
    end

    it "should initialize the wrapper properly" do
      @soap_wrapper.should_not be_nil
    end

    it "should get some cities in India" do
      cities = @soap_wrapper.get_cities_by_country("India")
      cities.size.should_not == 0
    end

    it "should return blank array if country is wrong" do
      cities = @soap_wrapper.get_cities_by_country("Noida")
      cities.size.should == 0
    end

    #it "should get some cities in Germany" do
    #  @soap_wrapper.get_cities_by_country("Germany").size.should_not == 0
    #end

    it "should get weather for Jodhpur India" do
      weather = @soap_wrapper.get_weather("Jodhpur", "India")
      weather.status.should == "Success"
    end

    it "should not crash for bad data" do
      weather = @soap_wrapper.get_weather("Jakarta", "India")
      weather.should be_nil
    end

    it "should handle exception properly" do
      soap_client = double("SOAPClient")
      soap_client.stub(:get_cities_by_country).and_raise(Exception)
      parser = Weatherman::Parser.new
      soap_wrapper = Weatherman::SOAPWrapper.new(soap_client, parser)
      lambda { soap_wrapper.get_cities_by_country("") }.should raise_error(WeathermanException)
    end

  end
end

