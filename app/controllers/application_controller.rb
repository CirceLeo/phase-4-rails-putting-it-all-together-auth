class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  before_action :authorize

  private

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not Authorized"]}, status: :unauthorized unless @current_user
  end

  def render_invalid invalid
    render json: {errors: invalid.record.errors.full_messages}, status: 422
  end
  
  def render_not_found unfound
    render json: {error: "#{controller_name.classify} not found"}, status: 404
  end


end
