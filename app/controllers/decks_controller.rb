class DecksController < ApplicationController

  def index
    render :json => { decks: Deck.formatted }
  end
  
end
