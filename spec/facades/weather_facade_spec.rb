require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'gets weather data for given coordinates from weather service and creates forecast object' do
    forecast = WeatherFacade.get_forecast(39.738453, -104.984853)
    expect(forecast).to be_a(Forecast)
  end

  it 'gets a smaller amount of data for given coordinates' do
    tiny_forecast = WeatherFacade.get_tiny_forecast(39.738453, -104.984853)
    expect(tiny_forecast).to be_a(TinyForecast)
  end
end
