class User < ApplicationRecord
	before_validation :downcase_email
	validates :email, presence: true
	validates :email, uniqueness: true
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

	    def downcase_email
		  self.email = email.downcase if email.present?
		end
end
