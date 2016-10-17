class WelcomesController < ApplicationController
  protect_from_forgery with: :exception
  def letsencrypt
    # use your code here, not mine
    render text: "K3qow1aVCBhOtkVuIO0dc1JMJFmUEMmf1jtXJCKKTlQ.09snjbs1AwJYZya5OYHMmHUv8KQhVNQPmL9S5CYw5iU"
  end
end
