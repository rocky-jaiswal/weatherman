require_relative '../spec_helper'

describe Weatherman do
  describe "Parser" do

    before(:each) do
      @parser = Weatherman::Parser.new
    end

    it "should parse cities response XML properly" do
      response = '<NewDataSet><Table><Country>British Indian Ocean Territory</Country><City>Diego Garcia</City></Table><Table><Country>India</Country><City>Ahmadabad</City></NewDataSet>'
      cities = @parser.parse_cities_response(response)
      cities.size.should == 2
      cities.select{|c| c.city_name == "Ahmadabad"}.size.should == 1
    end

    it "should parse weather response XML properly" do
      response = '<CurrentWeather><Location>Jodhpur, India (VIJO) 26-18N 073-01E 224M</Location><Time>Jan 25, 2010 - 02:30 AM EST / 2010.01.25 0730 UTC</Time><Wind> from the NE (050 degrees) at 5 MPH (4 KT):0</Wind><Visibility> 3 mile(s):0</Visibility><Temperature> 75 F (24 C)</Temperature><Pressure> 30.06 in. Hg (1018 hPa)</Pressure><Status>Success</Status></CurrentWeather>'
      weather = @parser.parse_weather_response(response)
      weather.status.should == "Success"
      weather.temperature.should == "75 F (24 C)"
    end

    it "should parse not found city properly" do
      response = "Data Not Found"
      weather = @parser.parse_weather_response(response)
      weather.should be_nil
    end

  end
end