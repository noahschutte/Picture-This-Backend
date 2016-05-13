class Round < ActiveRecord::Base
  validates :creator_id, :prompt_id, presence: true

  has_many :participants, through: :participant_rounds
  has_many :photos
  has_many :invites, through: :round_invites
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :prompt
end
