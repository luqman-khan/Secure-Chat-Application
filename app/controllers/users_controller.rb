class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params.merge({confirm: false}))
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver!
        format.html { redirect_to new_user_path, notice: 'User was successfully created.' }
        format.json { render json: {notice: "Please confirm your emai #{@user.email}"} }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_email
    user = User.find_by_confirmation_token(params[:id])
    @user = User.new
    if user
      user.email_activate
      flash[:success] = "Welcome to the Chat App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to new_user_url(@user)
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to new_user_url(@user)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :salt)
    end
end
