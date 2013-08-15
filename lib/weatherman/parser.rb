require 'weatherman/city'
require 'weatherman/weather'

module Weatherman
  class Parser

    def parse_cities_response(response)
      xml = Nokogiri::XML(response)
      build_cities(xml)
    end

    def parse_weather_response(response)
      xml = Nokogiri::XML(response)
      link = xml.xpath("//CurrentWeather").first
      return nil if link.nil?
      return build_weather(link) unless link.nil?
    end

    private

    def build_cities(xml)
      cities = []
      xml.xpath("//NewDataSet").each do |tab|
        tab.xpath("//Table/Country").children.each_with_index do |country, index|
          country_name = country.content.strip
          city_name = tab.xpath("//Table/City").children[index].content.strip
          city = Weatherman::City.new(city_name, country_name)
          cities << city
        end
      end
      cities
    end

    def build_weather(link)
      values = {}
      paths = {location: "//Location", time: "//Time", wind: "//Wind", visibility: "//Visibility", temperature: "//Temperature", pressure: "//Pressure", status: "//Status"}
      paths.each do |key, val|
        values[key] = link.xpath(paths[key]).first.content.strip if link.xpath(paths[key]).first
      end
      Weatherman::Weather.new(values)
    end

  end
end