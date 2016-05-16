class RoundsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    render :json => { pending_rounds: user.pending_rounds, submitted_rounds: user.submitted_rounds }
  end

  def create
    round = Round.create(creator_id: params[:id], prompt_id: Deck.random_prompt(params[:deck_id]), end_time: DateTime.now + 1.days)
    User.add_participants(round, params[:participants])
    render :json => { round: Round.formatted(round) }
  end

end
