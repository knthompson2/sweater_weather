class WeatherFacade
  class << self
    def get_forecast(lat, long)
      result = WeatherService.get_weather(lat, long)
      Forecast.new(result)
    end
  end
end
