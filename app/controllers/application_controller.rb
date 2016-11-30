class ApplicationController < ActionController::Base
  attr_reader :current_user
  protect_from_forgery

  def after_sign_in_path_for(resource)
    welcome_page_welcomes_path
  end

  protected
  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  	rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private
  def http_token
  	respond_to do |format|
        format.html {
        	@http_token ||= if params['Authorization'].present?
        	params['Authorization']
        	end
        }
        format.json{
      		@http_token ||= if request.headers['Authorization'].present?
        	request.headers['Authorization'].split(' ').last
        	end
        }
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
