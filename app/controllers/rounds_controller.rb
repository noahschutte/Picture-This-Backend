class RoundsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    render :json => { pending_rounds: user.pending_rounds, submitted_rounds: user.submitted_rounds }
  end

  def create
    round = Round.new(creator_id: params[:id], prompt_id: Deck.random_prompt(params[:deck_id]), end_time: DateTime.now + 1.days)
    if round.save
      round.add_participants(params[:contact_numbers])
      render :json => { round: Round.formatted(round) }
    else
      render :status => :not_modified
    end
  end

end
