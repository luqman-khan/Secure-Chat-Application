class Message < ApplicationRecord
	belongs_to :user, foreign_key: "from"
	belongs_to :contact
	scope :for_users, -> (current_user,contact_user) {where(to: [current_user.id,contact_user.id], from: [current_user.id,contact_user.id]).order(:created_at)}
end
