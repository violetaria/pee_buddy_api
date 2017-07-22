class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def register
    @user = User.new(create_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email].downcase, password: params[:password])
    if @user.present?
      render json: @user, status: :ok
    else
      render json: { errors: 'User/Password combination not found' }, status: :not_found
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
