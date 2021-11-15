class ActivityService
  class << self
    def get_activity(type)
      response = Faraday.get('http://www.boredapi.com/api/activity') do |f|
        f.params['type'] = type
      end
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

  end
end
