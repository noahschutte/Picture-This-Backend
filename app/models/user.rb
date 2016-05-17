class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, :phone, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :participant_rounds, foreign_key: :participant_id
  has_many :rounds, through: :participant_rounds
  has_many :photos

  def open_rounds
    self.rounds.where("end_time > ?", DateTime.now)
  end

  def pending_rounds
    self.open_rounds.select { |round| round.attr_hash unless round.has_photos?(self.id) }
  end

  def submitted_rounds
    self.open_rounds.select { |round| round.attr_hash if round.has_photos?(self.id) }
  end

  def formatted
    { first_name: self.first_name, photo: self.photos.find_by(round_id: round.id).image_url.to_s }
  end

end
