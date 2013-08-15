module Weatherman

  class Weather

    attr_reader :location, :time, :wind, :visibility, :temperature, :pressure, :status

    def initialize(attributes = {})
      @location = attributes[:location]
      @time = attributes[:time]
      @wind = attributes[:wind]
      @visibility = attributes[:visibility]
      @temperature = attributes[:temperature]
      @pressure = attributes[:pressure]
      @status = attributes[:status]
    end

  end
  
end