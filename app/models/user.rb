class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, :phone, uniqueness: true

  
end
