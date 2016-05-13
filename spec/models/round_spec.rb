require 'rails_helper'

describe Round do

  it { should belong_to :prompt }
  it { should belong_to :creator }
  it { should have_many :photos }
  it { should have_many :participants }

end
