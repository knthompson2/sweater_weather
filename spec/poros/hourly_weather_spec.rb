require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes' do
    info =
        {
            "dt": 1636848000,
            "temp": 57.72,
            "feels_like": 54.52,
            "pressure": 1015,
            "humidity": 28,
            "dew_point": 25.7,
            "uvi": 0,
            "clouds": 14,
            "visibility": 10000,
            "wind_speed": 7.07,
            "wind_deg": 339,
            "wind_gust": 12.84,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "pop": 0
        }
    hourly = HourlyWeather.new(info)

    expect(hourly).to be_a(HourlyWeather)
    expect(hourly.time).to eq("05:11 PM")
    expect(hourly.temp).to eq(57.72)
    expect(hourly.conditions).to eq("few clouds")
    expect(hourly.icon).to eq("02n")
  end
end
