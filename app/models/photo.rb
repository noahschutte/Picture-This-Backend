class Photo < ActiveRecord::Base
  validates :round_id, :user_id, :prompt_id, presence: true
end
