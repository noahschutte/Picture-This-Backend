class ContactsController < ApplicationController

  def index
    @contacts = User.all
    @round = Round.new
  end

end
