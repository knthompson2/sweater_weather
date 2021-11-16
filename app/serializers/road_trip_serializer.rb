class RoadTripSerializer
  class << self
    def new(origin, destination, route_time, forecast)
        {
        "data": {
          "id": nil,
          "type": "roadtrip",
          "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": route_time,
            "weather_at_eta": {
              "temperature": forecast.temp,
              "conditions": forecast.conditions
            }
          }
        }
      }
    end

    def impossible_route(origin, destination)
      {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": "impossible route"
          }
        }
      }
    end
  end
end
