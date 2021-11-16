class Api::V1::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params[:email] = user_params[:email].downcase
    new_user = User.new(user_params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: 'missing field'}, status: 400
    elsif User.find_by(email: params[:email])
      render json: { error: 'user already exists'}, status: 400
    elsif new_user.save
      session[:user_id] = new_user.id
      new_user.create_api_key
      render json: UserSerializer.new(new_user), status: :ok
    else
      render json: { error: 'bad request' }, status: 400
    end
  end
  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
