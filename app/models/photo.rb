class Photo < ActiveRecord::Base
  validates :round_id, :user_id, :prompt_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :round
  belongs_to :user
  belongs_to :prompt

  def self.submitted_participants(round)
    round.participants.select { |participant| participant.formatted if participant.photos.find_by(round_id: round.id) }
  end

  def self.pending_participants(round)
    round.participants.map { |participant|
      { first_name: participant.first_name } unless participant.photos.find_by(round_id: round.id) }
  end

end
