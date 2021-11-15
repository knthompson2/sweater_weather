class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:query].empty?
      render json: {error: "bad-request"}, status: 400
    else
      image = ImageFacade.get_image_info(params[:query])
      render json: ImageSerializer.new(image), status: 200
    end
  end
end
