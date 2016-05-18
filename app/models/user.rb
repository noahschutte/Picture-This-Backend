class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :phone, :password, presence: true
  validates :email, :phone, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :phone, :with => /^\d{10}$/, multiline: true

  has_many :participant_rounds, foreign_key: :participant_id
  has_many :rounds, through: :participant_rounds
  has_many :photos

  def open_rounds
    self.rounds.where("end_time > ?", DateTime.now)
  end

  def closed_rounds
    self.rounds.where("end_time < ?", DateTime.now).reverse
  end

  def pending_rounds
    self.open_rounds.find_all { |round| !round.has_photos?(self.id)}.reverse
  end

  def submitted_rounds
    self.open_rounds.find_all { |round| round.has_photos?(self.id)}.reverse
  end

end
