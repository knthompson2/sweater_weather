class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].empty?
      render json: {error: "bad-request"}, status: 400
    else
      coordinates = MapquestFacade.get_location(params[:location])
      forecast = WeatherFacade.get_forecast(coordinates.latitude, coordinates.longitude)
      render json: ForecastSerializer.new(forecast), status: 200
    end
  end
end
