class Prompt < ActiveRecord::Base
  validates :deck_id, :body, presence: true
  validates :body, uniqueness: true

  has_many :rounds
  has_many :photos
  belongs_to :deck
end
