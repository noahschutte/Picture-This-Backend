class RoundsController < ApplicationController

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

    def open_rounds(user)
      user.rounds.where("end_time > ?", DateTime.now)
    end

end
