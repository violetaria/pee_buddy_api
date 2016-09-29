class ApplicationController < ActionController::API
  helper_method :current_user

  def current_user
    authentication_token = request.headers["token"]
    ## TODO may need to look at DB optimization
    authentication_token.present? && User.find_by!(authentication_token: authentication_token)
  end

  def authenticate_user!
    unless current_user
      authentication_token = request.headers["token"]
      render json: { error: "Could not authenticate with authentication_token:'#{authentication_token}'" }, status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: "Object not found: #{error.message}" }, status: :not_found
  end
end
