class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, :phone, uniqueness: true

  has_many :participant_rounds
  # has_many :rounds, foreign_key: :creator_id ## Is this line necessary?
  has_many :rounds, through: :participant_rounds
  has_many :photos
end
