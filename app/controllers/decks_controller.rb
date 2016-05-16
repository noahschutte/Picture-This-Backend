class DecksController < ApplicationController

  def index
    decks = []
    Deck.all.each do |deck|
      decks << { id: deck.id, name: deck.name }
    end
    render :json => { decks: decks }
  end

end
