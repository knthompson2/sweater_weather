class WeatherFacade
  class << self
    def get_forecast(lat, long)
      result = WeatherService.get_weather(lat, long)
      Forecast.new(result)
    end

    def get_arrival_forecast(lat, lon, hour)
      result = WeatherService.get_weather(lat, lon)[:hourly][hour]
      ArrivalForecast.new(result)
    end
  end
end
