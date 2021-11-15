class ImageService
  class << self
    def get_image(query)
      response = conn.get('/search/photos') do |f|
        f.params['query'] = query
        f.params['per_page'] = 1
      end
      parse_json(response)
    end

    def conn
      Faraday.new('https://api.unsplash.com') do |f|
        f.params['client_id'] = ENV['unsplash_access_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
