class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone: params[:phone], password: params[:password])
    render :json => { user_id: @user.id }
  end

  def show
    @user = User.find_by(id: params[:id])
    @rounds = closed_rounds(@user)
    rounds = []
    @rounds.each do |round|
      rounds << {round_id: round.id, creator_id: round.creator_id, creator_first_name: round.creator.first_name, prompt: round.prompt.body, end_time: round.end_time}
    end
    render :json => { rounds: rounds }
  end

  def closed_rounds(user)
    user.rounds.where("end_time < ?", DateTime.now)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end
end
