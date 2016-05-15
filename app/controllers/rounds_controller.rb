class RoundsController < ApplicationController
  # after_action :set_access_control_headers
  #
  # def set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = "*"
  #   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  # end

  def show
    @round = Round.find_by(id: params[:id])
    @prompt = @round.prompt
    @user = User.find_by(id: session[:user_id])

    participants = []
    @round.participants.each do |participant|
      participants << participant.first_name
    end
    render :json => {
      prompt: { id: @prompt.id },
      round: { id: @round.id, end_time: @round.end_time, participants: participants }
    }
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @rounds = open_rounds(@user)
    rounds = []
    @rounds.each do |round|
      rounds << {round_id: round.id, creator_id: round.creator_id, creator_first_name: round.creator.first_name, prompt: round.prompt.body, end_time: round.end_time}
    end
    render :json => { rounds: rounds }
  end

  def new
  end

  def create
    @round = Round.new(creator_id: params[:id], prompt_id: select_prompt(params[:deck_id]), end_time: params[:end_time])
    if @round.save
      participants = []

      params[:participants].each do |participant|
        invite = User.find_by(phone: participant[1])
        @round.participants << invite
        participant_info = [invite.first_name, invite.phone]
        participants << participant_info
      end

      round = {round_id: @round.id, creator_id: @round.creator_id, creator_first_name: @round.creator.first_name, prompt: @round.prompt.body, end_time: @round.end_time}

      render :json => { round: round, participants: participants }
    end
  end

  def select_prompt(deck_id)
    Deck.find(deck_id).prompts.sample.id
  end

  def open_rounds(user)
    user.rounds.where("end_time > ?", DateTime.now)
  end

end
