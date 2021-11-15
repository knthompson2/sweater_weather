class Activities
  attr_reader :id, :destination, :forecast, :activities

  def initialize(info, relaxation, location, lat, lon)
    @id = nil
    @destination = location
    @forecast = WeatherFacade.get_tiny_forecast(lat, lon)
    @activities = [IndividualActivity.new(info), IndividualActivity.new(relaxation)]
  end
end
