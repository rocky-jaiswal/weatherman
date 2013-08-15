module Weatherman

  class City
    attr_reader :city_name, :country_name

    def initialize(city_name, country_name)
      @city_name = city_name
      @country_name = country_name
    end
  end
  
end