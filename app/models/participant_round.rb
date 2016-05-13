class ParticipantRound < ActiveRecord::Base
  validates :round_id, :participant_id, presence: true

  belongs_to :round
  belongs_to :participant, class_name: "User", foreign_key: :participant_id
end
