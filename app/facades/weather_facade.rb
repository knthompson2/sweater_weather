class WeatherFacade
  class << self
    def get_forecast(lat, long)
      result = WeatherService.get_weather(lat, long)
      Forecast.new(result)
    end

    def get_tiny_forecast(lat, long)
      result = WeatherService.get_weather(lat, long)
      TinyForecast.new(result)
    end
  end
end
