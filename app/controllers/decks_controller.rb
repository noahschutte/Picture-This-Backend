class DecksController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @decks = Deck.all
  end

end
