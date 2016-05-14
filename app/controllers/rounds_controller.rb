class RoundsController < ApplicationController

    def show
      @round = Round.find_by(id: params[:id])
      @prompt = @round.prompt
      @user = User.find_by(id: session[:user_id])
    end

    def index
      @user = User.find_by(id: params[:user_id])
      # Where rounds are open
      @rounds = @user.rounds
      # This includes all rounds where a user is a participant
      # Need to downselect to rounds that are still open
    end

    def new
    end

end
