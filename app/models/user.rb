class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length:{ maximum: 24 }
  validates :email, presence: true, uniqueness: true, length:{ maximum: 32 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password
end
