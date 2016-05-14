class DecksController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    @decks = Deck.all
    # Remove this hard-coded value
    # Need to randomize prompt based on Deck selected
    @prompt = Prompt.first
    decks = []
    @decks.each do |deck|
      decks << { id: deck.id, name: deck.name }
    end
    render :json => { decks: decks }
  end

end
