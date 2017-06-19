class ApplicationController < ActionController::API
  helper_method :current_user

  before_action :authenticate_user!
  before_action :set_default_response_format

  def current_user
    authentication_token = request.headers['X-BSS-PeeBuddy']
    @current_user ||= authentication_token.present? && User.find_by(authentication_token: authentication_token)
    @current_user
  end

  def authenticate_user!
    unless current_user
      authentication_token = request.headers['X-BSS-PeeBuddy']
      render json: { error: "Could not authenticate with authentication_token:'#{authentication_token}'" }, status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: "Object not found: #{error.message}" }, status: :not_found
  end

  private

  def set_default_response_format
    request.format = :json
  end
end
