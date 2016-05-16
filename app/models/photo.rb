class Photo < ActiveRecord::Base
  validates :round_id, :user_id, :prompt_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :round
  belongs_to :user
  belongs_to :prompt

  def self.submitted_participants(round)
    round.participants.select do |participant|
      if participant.photos.find_by(round_id: round.id)
        { id: participant.id, first_name: participant.first_name, photo: participant.photos.find_by(round_id: round.id).image_url.to_s }
      end
    end
  end

  def self.pending_participants(round)
    round.participants.map do |participant|
      if !participant.photos.find_by(round_id: round.id)
        { id: participant.id, first_name: participant.first_name, photo: "" }
      end
    end
  end
end
