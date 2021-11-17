class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].nil?
      render json: {error: "bad-request"}, status: 400
    else
      image = ImageFacade.get_image_info(params[:location])
      render json: ImageSerializer.new(image), status: 200
    end
  end
end
