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
    { round_id: self.id,
      creator_id: self.creator_id,
      creator_first_name: self.creator.first_name,
      prompt: self.prompt.body,
      end_time: self.end_time }
  end

  def add_participants(contact_numbers)
    self.participants = contact_numbers.map{ |phone_number| User.find_by(phone: phone_number) }
  end

  def self.hash_collection(rounds_array)
    rounds_array.map { |round| round.attr_hash }
  end
end
