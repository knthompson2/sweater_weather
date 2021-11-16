class Api::V1::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params[:email] = user_params[:email].downcase
    new_user = User.new(user_params)
    if new_user.save
      # session[:user_id] = new_user.id
      new_user.create_api_key
      render json: UserSerializer.new(new_user), status: :ok
    else
      render json: { error: 'bad request' }, status: :bad_request
    end
  end
  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
