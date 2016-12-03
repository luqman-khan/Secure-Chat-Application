class Contact < ApplicationRecord
  belongs_to :user
  has_many :messages
  scope :get_contact, -> (current_user, contact_user){where(user_id: current_user, contact_user: contact_user).first}
  scope :from_user, -> (current_user){where(user_id:current_user)}
  scope :to_user, -> (current_user){where(contact_user:current_user)}
  # validates :contact_user, presence: true
end
