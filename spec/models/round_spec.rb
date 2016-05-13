require 'rails_helper'

describe Round do

  # before(:each) do
    # @round = Round.create(creator_id: @creator.id, prompt_id: @prompt.id)
  # end

  # it 'should have an id as a Fixnum' do
    # expect((@round.id).class.to_s).to eq("Fixnum")
  # end

  it { should belong_to :prompt }
  it { should belong_to :creator }
  it { should have_many :photos }
  it { should have_many :participants }

end
