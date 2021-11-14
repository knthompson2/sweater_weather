require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes' do
    info = WeatherService.get_weather(39.738453, -104.984853)
    forecast = Forecast.new(info)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(CurrentWeather)
    expect(forecast.daily.first).to be_a(DailyWeather)
    expect(forecast.daily.count).to eq(5)
    expect(forecast.hourly.count).to eq(8)
  end
end
