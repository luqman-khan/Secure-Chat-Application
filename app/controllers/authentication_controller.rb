class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user.valid_password?(params[:user][:password])
      respond_to do |format|
        format.html {
          token = JsonWebToken.encode({user_id: user.id})
          redirect_to welcome_page_welcomes_url(params[:resource], { "Authorization": token })
        }
        format.json {render json: payload(user)}
      end
    else
      respond_to do |format|
        format.html {
          redirect_to after_sign_out_path_for(params[:resource])}
        format.json {render json: {errors: ['Invalid Username/Password']}, status: :unauthorized}
      end
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end