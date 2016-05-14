class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_rounds_path(@user)
    else
      render "new"
      #error message handling needed
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @rounds = closed_rounds(@user)
    # This includes all rounds where a user is a participant
    # Need to downselect to rounds that are closed
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end

end
