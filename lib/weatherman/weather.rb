module Weatherman
  class Weather

    attr_reader :location, :time, :wind, :visibility, :temperature, :pressure, :status

    def initialize(location, time, wind, visibility, temperature, pressure, status)
      @location = location
      @time = time
      @wind = wind
      @visibility = visibility
      @temperature = temperature
      @pressure = pressure
      @status = status
    end

  end
end