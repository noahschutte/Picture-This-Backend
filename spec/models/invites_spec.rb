require 'rails_helper'

describe Invite do

  it { should have_many :rounds }
  # it { should have_one :phone }
  # it { should have_one :email }
end
