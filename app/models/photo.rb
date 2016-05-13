class Photo < ActiveRecord::Base
  validates :round_id, :user_id, :prompt_id, presence: true

  belongs_to :round
  belongs_to :user
  belongs_to :prompt
end
