class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length:{ maximum: 24 }
  validates :email, presence: true, uniqueness: true, length:{ maximum: 32 }
  validates :birthdate, presence: true
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  has_many :videos
  has_many :ratings
  has_many :comments
  has_many :groups
end
