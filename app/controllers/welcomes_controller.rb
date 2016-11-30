class WelcomesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_request!
  def letsencrypt
    # use your code here, not mine
    render text: "K3qow1aVCBhOtkVuIO0dc1JMJFmUEMmf1jtXJCKKTlQ.09snjbs1AwJYZya5OYHMmHUv8KQhVNQPmL9S5CYw5iU"
  end

  def welcome_page
  	@welcome = 'Welcome to the Secure CHAT APP by Luqman and Sharol'
  	respond_to do |format|
  		format.html{}
  		format.json{render json: {welcome: @welcome}}
  	end
  end
end
