class Api::V1::RoadTripController < ApplicationController
  before_action :require_api_key
  before_action :require_start_and_end

  def create
    if route_time
      hour = route_time[0..1].to_i
      coordinates = MapquestFacade.get_location(destination)
      forecast = WeatherFacade.get_arrival_forecast(coordinates.latitude, coordinates.longitude, hour)
      render json: RoadTripSerializer.new(origin, destination, route_time, forecast), status: 200
    else
      render json: RoadTripSerializer.impossible_route(origin, destination), status: 200
    end
  end

  private
  def route_time
    MapquestFacade.get_route_time(origin, destination)
  end

  def origin
    params[:origin]
  end

  def destination
    params[:destination]
  end

  def require_start_and_end
    unless origin && destination
      render json: { error: "bad request"}, status: 400
    end
  end

  def user_api_key
    User.find_by(api_key: params[:api_key])
  end

  def require_api_key
    unless user_api_key
      render json: { error: "Unauthorized request" }, status: 401
    end
  end


end
