class RoundsController < ApplicationController

    def show
      @round = Round.find_by(id: params[:id])
    end

    def index
      @user = User.find_by(id: params[:user_id])
      @rounds = []
      Round.all.each do |r|
        r.participants.each do |p|
          if p.id == @user.id
            @rounds << r
          end
        end
      end
      # This includes all rounds where a user is a participant
      # Need to downselect to rounds that are still open
    end

    def new
    end

end
