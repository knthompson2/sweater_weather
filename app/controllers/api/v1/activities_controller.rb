class Api::V1::ActivitiesController < ApplicationController
  def index
    if !params[:destination].empty?
      coordinates = MapquestFacade&.get_location(params[:destination])
      forecast = WeatherFacade&.get_tiny_forecast(coordinates.latitude, coordinates.longitude)
        if forecast.temp >= 60
          activity = ActivityFacade.create_activities("recreational", params[:destination], coordinates.latitude, coordinates.longitude)
          render json: ActivitiesSerializer.new(activity), status: 200
        elsif forecast.temp >=50 && forecast.temp < 60
          activity = ActivityFacade.create_activities("busywork", params[:destination], coordinates.latitude, coordinates.longitude)
          render json: ActivitiesSerializer.new(activity), status: 200
        elsif forecast.temp < 50
          activity = ActivityFacade.create_activities("cooking", params[:destination], coordinates.latitude, coordinates.longitude)
          render json: ActivitiesSerializer.new(activity), status: 200
        end
    else
      render json: {error: "bad-request"}, status: 400
    end
  end
end
