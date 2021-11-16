class Api::V1::UsersController < ApplicationController
  def create
    user_params[:email] = user_params[:email].downcase
    new_user = User.new(user_params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: 'missing field'}, status: 400
    elsif User.find_by(email: params[:email])
      render json: { error: 'user already exists'}, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { error: "fields don't match"}, status: 400
    elsif new_user.save
      render json: UsersSerializer.new(new_user), status: :ok
    else
      render json: { error: 'bad request' }, status: 400
    end
  end
  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
