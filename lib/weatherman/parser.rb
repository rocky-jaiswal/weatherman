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
      location = link.xpath("//Location").first.content.strip
      time = link.xpath("//Time").first.content.strip
      wind = link.xpath("//Wind").first.content.strip
      visibility = link.xpath("//Visibility").first.content.strip
      temperature = link.xpath("//Temperature").first.content.strip
      pressure = link.xpath("//Pressure").first.content.strip
      status = link.xpath("//Status").first.content.strip
      Weatherman::Weather.new(location, time, wind, visibility, temperature, pressure, status)
    end

  end
end