class User < ApplicationRecord
	before_create :confirm_token

	def email_activate
	    self.confirm = true
	    self.confirmation_token = nil
	    save!(:validate => false)
	end

	private
		def confirm_token
	      if self.confirmation_token.blank?
	          self.confirmation_token = SecureRandom.urlsafe_base64.to_s
	      end
	    end
end
