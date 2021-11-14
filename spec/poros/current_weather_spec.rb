require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    info = {
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
  current = CurrentWeather.new(info)

  expect(current).to be_a(CurrentWeather)
  expect(current.datetime).to eq("2021-11-13 17:57:00.000000000 -0700")
  expect(current.sunrise).to eq("2021-11-13 06:42:42.000000000 -0700")
  expect(current.sunset).to eq("2021-11-13 16:46:03.000000000 -0700")
  expect(current.temp).to eq(57.51)
  expect(current.feels_like).to eq(54.37)
  expect(current.humidity).to eq(30)
  expect(current.uvi).to eq(0)
  expect(current.visibility).to eq(10000)
  expect(current.conditions).to eq("clear sky")
  expect(current.icon).to eq("01n")
  end
end
