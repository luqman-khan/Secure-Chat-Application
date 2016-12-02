class Contact < ApplicationRecord
  belongs_to :user
  # validates :contact_user, presence: true
end
