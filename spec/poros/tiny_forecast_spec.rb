require 'rails_helper'

RSpec.describe TinyForecast do
  it 'exists and has attributes' do
    info = info = {
    "lat": 39.7385,
    "lon": -104.9849,
    "timezone": "America/Denver",
    "timezone_offset": -25200,
    "current": {
        "dt": 1636851420,
        "sunrise": 1636810962,
        "sunset": 1636847163,
        "temp": 57.51,
        "feels_like": 54.37,
        "pressure": 1015,
        "humidity": 30,
        "dew_point": 27,
        "uvi": 0,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 1.01,
        "wind_deg": 148,
        "wind_gust": 1.99,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01n"
            }
        ]
    }
  }
    tiny_forecast = TinyForecast.new(info)

    expect(tiny_forecast).to be_a(TinyForecast)
    expect(tiny_forecast.temp).to eq(57.51)
    expect(tiny_forecast.summary).to eq("clear sky")
  end
end
