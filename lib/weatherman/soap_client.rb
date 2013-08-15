require 'weatherman/exception'
require 'weatherman/constants'
require 'savon'

module Weatherman
  class SOAPClient

    def initialize
      begin
        @client = Savon.client(wsdl: Weatherman::WSDL_ENDPOINT)
      rescue Exception => ex
        raise WeathermanException, ex.message
      end
    end

    def get_cities_by_country(country)
      @client.call(:get_cities_by_country, message: { "CountryName" => country }).body
    end

    def get_weather(city, country)
      @client.call(:get_weather, message: { "CityName" => city, "CountryName" => country }).body
    end

    #Not really used
    def get_operations
      @client.operations
    end

  end
end
