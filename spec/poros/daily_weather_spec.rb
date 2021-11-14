require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes' do
    info = {
            "dt": 1636826400,
            "sunrise": 1636810962,
            "sunset": 1636847163,
            "moonrise": 1636838880,
            "moonset": 1636790160,
            "moon_phase": 0.33,
            "temp": {
                "day": 60.13,
                "min": 46.99,
                "max": 63.77,
                "night": 50.95,
                "eve": 57.72,
                "morn": 48.06
            },
            "feels_like": {
                "day": 57.07,
                "night": 47.35,
                "eve": 54.52,
                "morn": 45.57
            },
            "pressure": 1015,
            "humidity": 26,
            "dew_point": 24.91,
            "wind_speed": 8.05,
            "wind_deg": 296,
            "wind_gust": 26.37,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0,
            "uvi": 2.07
        }

    daily = DailyWeather.new(info)

    expect(daily).to be_a(DailyWeather)
    expect(daily.datetime).to eq("2021-11-13 11:00:00.000000000 -0700")
    expect(daily.sunrise).to eq("2021-11-13 06:42:42.000000000 -0700")
    expect(daily.sunset).to eq("2021-11-13 16:46:03.000000000 -0700")
    expect(daily.max_temp).to eq(63.77)
    expect(daily.min_temp).to eq(46.99)
    expect(daily.conditions).to eq("overcast clouds")
    expect(daily.icon).to eq("04d")
  end
end
