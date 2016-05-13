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

  it "has a first name" do
    expect(@user.first_name).to eq('Milan')
  end

  it "has an email" do
    expect(@user.email).to eq('milan@milan.milan')
  end

  it "has a password" do
    expect(@user.password).to eq('qwerty')
  end

end
