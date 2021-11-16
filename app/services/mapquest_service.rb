class MapquestService
  class << self
    def get_geocode(location)
      response = conn.get('/geocoding/v1/address') do |f|
        f.params['location'] = location
      end
      parse_json(response)
    end

    def get_directions(start_city, end_city)
      response = conn.get('/directions/v2/route') do |f|
        f.params['from'] = start_city
        f.params['to'] = end_city
      end
      parse_json(response)
    end

    def conn
      Faraday.new('http://www.mapquestapi.com') do |f|
        f.params['key'] = ENV['mapquest_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
