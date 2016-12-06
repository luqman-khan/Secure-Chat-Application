class AuthenticationController < ApplicationController
  before_action :get_user

  def authenticate_user
    
    if (@user.password == auth_params[:password] && @user.confirm)
      respond_to do |format|
        format.html {
          token = JsonWebToken.encode({user_id: @user.id})
          redirect_to welcome_page_welcomes_url(params[:resource], { "Authorization": token })
        }
        format.json {render json: payload(@user)}
      end
    else
      respond_to do |format|
        format.html {
          redirect_to after_sign_out_path_for(params[:resource])}
        format.json {render json: {errors: ['Invalid Username/Password']}, status: :unauthorized}
      end
    end
  end

  def get_salt
    respond_to do |format|
      format.json {render json: {salt: @user.salt}}
    end
  end

  private

  def get_user
    @user = User.find_by_email(get_salt_params[:email])
  end

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

  def get_salt_params
    params.require(:user).permit(:email)
  end

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end