require 'rails_helper'

describe User do

  before(:each) do
    @user = User.create!(
      first_name: 'Milan',
      last_name: 'Paul',
      email: 'milan@milan.milan',
      phone: '+64 21 114 9935',
      password: 'qwerty'
    )
  end

  it "shows the user's first name" do
    expect(@user.first_name).to eq('Milan')
  end
end
