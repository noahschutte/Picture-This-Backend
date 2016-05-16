class RoundsController < ApplicationController
  after_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

  def show
    @round = Round.find_by(id: params[:id])
    @prompt = @round.prompt
    participants = []
    @round.participants.each do |participant|
      participants << participant.first_name
    end
    render :json => { prompt: { id: @prompt.id }, round: { id: @round.id, end_time: @round.end_time, participants: participants } }
  end

  def index
    user = User.find_by(id: params[:user_id])
    render :json => { open_rounds: Round.open_rounds(user), submitted_rounds: Round.submitted_rounds(user) }
  end

  def create
    @round = Round.create(creator_id: params[:id], prompt_id: select_prompt(params[:deck_id]), end_time: DateTime.now + 1.days)
    @round.participants << @round.creator
    participants = []
    params[:participants].each do |participant|
      invite = User.find_by(phone: participant[1])
      @round.participants << invite
      participant_info = [invite.first_name, invite.phone]
      participants << participant_info
    end

    round = {round_id: @round.id, creator_id: @round.creator_id, creator_first_name: @round.creator.first_name, prompt: @round.prompt.body, end_time: @round.end_time}

    render :json => { round: round }
  end

  def select_prompt(deck_id)
    Deck.find(deck_id).prompts.sample.id
  end

end
