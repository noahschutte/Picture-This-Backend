class RoundInvite < ActiveRecord::Base
  validates :round_id, :invite_id, presence: true

  belongs_to :round
  belongs_to :invite
end
