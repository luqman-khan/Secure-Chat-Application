class UserMailer < ActionMailer::Base
	default :from => "mail_confirmation@mad-hats.me"

 def registration_confirmation(user)
    @user = user
    mail(:to => @user.email, :subject => "Registration Confirmation")
 end
end