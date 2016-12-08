class Api::ApiController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :api_current_user

  before_action :authenticate_api_user!

  def authenticate_api_user!
    render json: {error: true, message: 'Authentication failed!'} and return if api_current_user.nil?
  end

  def api_current_user
    current_user || User.find_by_access_token(params[:access_token])
  end
end