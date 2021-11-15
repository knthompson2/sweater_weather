class Api::V1::ActivitiesController < ApplicationController
  def index
    if params[:destination].empty?
      render json: {error: "bad-request"}, status: 400
    else
      coordinates = MapquestFacade.get_location(params[:destination])
      forecast = WeatherFacade.get_tiny_forecast(coordinates.latitude, coordinates.longitude)
    end
    if forecast.temp >= 60
      activity = ActivityFacade.create_activities("recreational", params[:destination])
      render json: ActivitiesSerializer.new(activity), status: 200
    elsif forecast.temp >=50 && forecast.temp < 60
      activity = ActivityFacade.create_activities("busywork", params[:destination])
      render json: ActivitiesSerializer.new(activity), status: 200
    else
      activity = ActivityFacade.create_activities("cooking", params[:destination])
      render json: ActivitiesSerializer.new(activity), status: 200
    end
  end
end
