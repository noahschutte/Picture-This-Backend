class Prompt < ActiveRecord::Base
  validates :deck_id, :body, presence: true

  belongs_to :deck
end
