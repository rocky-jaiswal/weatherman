require 'weatherman/exception'
require 'weatherman/soap_client'
require 'weatherman/parser'

module Weatherman
  class SOAPWrapper

    def initialize(soap_client, parser)
      @soap_client = soap_client
      @parser = parser
    end

    def get_cities_by_country(country)
      begin
        response = @soap_client.get_cities_by_country(country)
        xml = response[:get_cities_by_country_response][:get_cities_by_country_result]
        @parser.parse_cities_response(xml)
      rescue Exception => ex
        raise WeathermanException, ex.message
      end
    end

    def get_weather(city, country)
      begin
        response = @soap_client.get_weather(city, country)
        xml = response[:get_weather_response][:get_weather_result]
        @parser.parse_weather_response(xml)
      rescue Exception => ex
        raise WeathermanException, ex.message
      end
    end

  end
end
