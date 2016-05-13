require 'rails_helper'

describe ParticipantRound do

  it { should belong_to :participant }
  it { should belong_to :round }

end
