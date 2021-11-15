class WeatherService
  class << self
    def get_weather(lat, long)
      response = conn.get('/data/2.5/onecall') do |f|
        f.params['lat'] = lat
        f.params['lon'] = long
        f.params['units'] = 'imperial'
        f.params['exclude'] = 'minutely,alerts'
      end
      parse_json(response)
    end

    def conn
      Faraday.new('https://api.openweathermap.org') do |f|
        f.params['appid'] = ENV['weather_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
