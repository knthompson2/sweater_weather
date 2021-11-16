class MapquestFacade
  class << self
    def get_location(location)
      result = MapquestService.get_geocode(location)[:results].first[:locations].first[:latLng]
      Location.new(result)
    end

    def get_route_time(start_city, end_city)
      MapquestService.get_directions(start_city, end_city)[:route][:formattedTime]
    end
  end
end
