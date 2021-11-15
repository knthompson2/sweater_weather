class Activities
  attr_reader :id, :destination, :forecast, :activities

  def initialize(info)
    @id = nil
    @destination = params[:destination]
    @forecast = Forecast.new(info)
  end
end
