require 'rails_helper'

describe Round do

  it { should belong_to :prompt}

  before(:each) do
    @deck = Deck.create(name: 'Comedic')
    @creator = User.create(first_name: 'Theo', last_name: 'Paul', email: 'a@b.c', phone: '12345', password: 'qwerty')
    @prompt = Prompt.create(deck_id: @deck.id, body: 'Bursting')
    @round = Round.create(creator_id: @creator.id, prompt_id: @prompt.id)
  end

  it 'should have an id as a Fixnum' do
    expect((@round.id).class.to_s).to eq("Fixnum")
  end

  context 'associations with Prompts' do
    it 'should belong to a prompt' do
      expect(@prompt.rounds).to match_array([])
    end
  end


end
