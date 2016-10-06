class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.from_facebook_token(params_for_create[:token], params_for_create[:user_id], params_for_create[:expires_at])
    render "create.json.jbuilder", status: :accepted
  end

  private

  def params_for_create
    params.require(:session).permit(:token, :user_id, :expires_at)
  end
end
