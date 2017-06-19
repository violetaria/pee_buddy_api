class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.from_facebook_token(params_for_create[:token], params_for_create[:user_id], params_for_create[:expires_at])
    render json: @user, serializer: UserSerializer, status: :accepted
  end

  def destroy
    session[:user_id] = nil
    render :nohead
  end

  private

  def params_for_create
    params.require(:session).permit(:token, :user_id, :expires_at)
  end
end
