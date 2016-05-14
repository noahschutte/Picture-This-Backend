class Round < ActiveRecord::Base
  validates :creator_id, :prompt_id, :end_time, presence: true

  has_many :round_invites
  has_many :invites, through: :round_invites
  has_many :photos
  has_many :participant_rounds
  has_many :participants, through: :participant_rounds, class_name: "User", foreign_key: :participant_id
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :prompt

end
