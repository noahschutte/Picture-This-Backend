require 'rails_helper'
require 'faker'

describe Deck do

  before(:each) do
    @deck = Deck.create!(
      name: 'Frenemies'
    )
    @prompts = [
      Prompt.create(deck_id: @deck.id, body: Faker::Hipster.words(1).join('')), Prompt.create(deck_id: @deck.id, body: Faker::Hipster.words(1).join('')), Prompt.create(deck_id: @deck.id, body: Faker::Hipster.words(1).join(''))
    ]
  end

  it 'has a deck name' do
    expect(@deck.name).to eq('Frenemies')
  end

  it 'has many prompts' do
    expect(@deck.prompts).to match_array(@prompts)
  end
end
