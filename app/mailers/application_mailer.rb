class ApplicationMailer < ActionMailer::Base
  default from: 'mail_confirmation@mad-hats.me'
  layout 'mailer'
end
