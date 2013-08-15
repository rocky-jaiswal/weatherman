require 'weatherman/version'
require 'weatherman/soap_client'
require 'weatherman/parser'
require 'weatherman/soap_wrapper'

module Weatherman
  
  def self.get_cities_by_country(country)
    soap_client = Weatherman::SOAPClient.new
    parser = Weatherman::Parser.new
    soap_wrapper = Weatherman::SOAPWrapper.new(soap_client, parser)
    soap_wrapper.get_cities_by_country(country)
  end

  def self.get_weather(city, country)
    soap_client = Weatherman::SOAPClient.new
    parser = Weatherman::Parser.new
    soap_wrapper = Weatherman::SOAPWrapper.new(soap_client, parser)
    soap_wrapper.get_weather(city, country)
  end

end
