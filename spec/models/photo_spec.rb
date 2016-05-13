require 'rails_helper'

describe Photo do

  it { should belong_to :round }
  it { should belong_to :prompt }
  it { should belong_to :user }

end
