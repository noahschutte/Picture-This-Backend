require 'rails_helper'

describe RoundInvite do
  it { should belong_to :round }
  it { should belong_to :invite }
end
