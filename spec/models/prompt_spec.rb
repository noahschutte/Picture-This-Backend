require 'rails_helper'

describe Prompt do

  before(:each) do
    @deck = Deck.create!(name: 'Friends')
    @prompt = Prompt.create!(deck_id: @deck.id, body: "Outlandish")
  end

  it 'should belong to a deck' do
    expect(@prompt.deck_id).to eq(@deck.id)
  end

  it 'should have a body' do
    expect(@prompt.body).to eq('Outlandish')
  end

end
