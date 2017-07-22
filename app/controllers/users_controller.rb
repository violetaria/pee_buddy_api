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
    render json: @user, status: :accepted
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
