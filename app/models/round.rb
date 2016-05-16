class Round < ActiveRecord::Base
  validates :creator_id, :prompt_id, :end_time, presence: true

  has_many :round_invites
  has_many :invites, through: :round_invites
  has_many :photos
  has_many :participant_rounds
  has_many :participants, through: :participant_rounds, class_name: "User", foreign_key: :participant_id
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  belongs_to :prompt

  def has_photos?(user_id)
    self.photos.any?{ |photo| photo.user_id == user_id}
  end

  def attr_hash
    {round_id: self.id, creator_id: self.creator_id, creator_first_name: self.creator.first_name, prompt: self.prompt.body, end_time: self.end_time}
  end

  def self.formatted(round)
    {round_id: round.id, creator_id: round.creator_id, creator_first_name: round.creator.first_name, prompt: round.prompt.body, end_time: round.end_time}
  end

end
