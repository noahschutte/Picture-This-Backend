class Round < ActiveRecord::Base
  validates :creator_id, :prompt_id, presence: true

  belongs_to :creator
  belongs_to :prompt
end
