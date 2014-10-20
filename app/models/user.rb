class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length:{ maximum: 24 }
  validates_confirmation_of :password
  validates :password_confirmation, :email, :birthdate, presence: true
end
