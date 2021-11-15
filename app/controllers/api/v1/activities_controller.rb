class Api::V1::ActivitiesController < ApplicationController
  def index
    if params[:destination].empty?
      render json: {error: "bad-request"}, status: 400
    else
      coordinates = MapquestFacade.get_location(params[:destination])
      forecast = WeatherFacade.get_tiny_forecast
  end
end
