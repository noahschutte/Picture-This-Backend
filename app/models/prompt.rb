class Prompt < ActiveRecord::Base
  validates :deck_id, :body, presence: true
  validates :body, uniqueness: true

  belongs_to :deck
end
