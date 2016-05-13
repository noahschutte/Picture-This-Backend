class Invite < ActiveRecord::Base
  validates :round_id, presence: true
  validates :phone, :email, uniqueness: true

  has_many :round_invites
  has_many :rounds, through: :round_invites
end
