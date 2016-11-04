class ApplicationController < ActionController::API

  # protect_from_forgery with: :exception
  # before_action :current_user

  private

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token])
  end

  def require_user
    if !current_user
      render json: ["You must be signed in for this!"], status: :forbidden
    end
  end

end
