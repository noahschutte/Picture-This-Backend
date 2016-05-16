class Deck < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :prompts

  def self.formatted
    Deck.all.map { |deck| { id: deck.id, name: deck.name } }
  end

  def self.random_prompt(deck_id)
    Deck.find(deck_id).prompts.sample.id
  end

end
