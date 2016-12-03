class Contact < ApplicationRecord
  belongs_to :user
  has_many :messages
  scope :get_contact, -> (current_user, contact_user){where(user_id: current_user, contact_user: contact_user).first}
  # validates :contact_user, presence: true
end
