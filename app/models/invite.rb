class Invite < ActiveRecord::Base
  validates :round_id, presence: true
  validates :phone, :email, uniqueness: true

  belongs_to :round
end
