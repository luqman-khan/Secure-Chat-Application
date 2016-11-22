class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require "scrypt"
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  def password_digest(password)
    self.password_salt = SCrypt::Engine.generate_salt
  	SCrypt::Engine.hash_secret password, self.password_salt
  end

   def valid_password?(password)
    self.encrypted_password == SCrypt::Engine.hash_secret(password, self.password_salt)
  end

end
