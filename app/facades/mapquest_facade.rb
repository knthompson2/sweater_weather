class MapquestFacade
  class << self
    def get_location(location)
      result = MapquestService.get_geocode(location)[:results].first[:locations].first[:latLng]
      Location.new(result)
    end
  end
end
