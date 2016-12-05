json.extract! user, :id, :email, :password, :salt, :confirm, :created_at, :updated_at
json.url user_url(user, format: :json)