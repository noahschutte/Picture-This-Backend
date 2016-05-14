class RoundsController < ApplicationController

    def show
      @round = Round.find_by(id: params[:id])
      @prompt = @round.prompt
      @user = User.find_by(id: session[:user_id])
    end

    def index

      @user = User.find_by(id: params[:user_id])

      @rounds = open_rounds(@user)
      if request.xhr?
        "#{@rounds}"
      else

      end
    end

    def new
    end

    def open_rounds(user)
      user.rounds.where("end_time > ?", DateTime.now)
    end

end
