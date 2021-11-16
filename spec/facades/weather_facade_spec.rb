require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'gets weather data for given coordinates from weather service and creates forecast object' do
    forecast = WeatherFacade.get_forecast(39.738453, -104.984853)
    expect(forecast).to be_a(Forecast)
  end

  it 'gets weather data for given coordinates from weather service and creates limited forecast object' do
    forecast = WeatherFacade.get_arrival_forecast(39.738453, -104.984853, 14)
    expect(forecast).to be_a(ArrivalForecast)
  end
end
