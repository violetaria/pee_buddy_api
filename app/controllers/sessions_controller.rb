class SessionsController < ApplicationController

  def create
    # @user = User.from_omniauth(env['omniauth.auth'])
    @user = User.from_facebook_token(params_for_create[:token], params_for_create[:user_id], params_for_create[:expires_at])
    session[:user_id] = @user.id
    binding.pry
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
