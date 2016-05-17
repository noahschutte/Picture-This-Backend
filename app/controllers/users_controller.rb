class UsersController < ApplicationController

  def create
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone: params[:phone], password: params[:password])
    if user.save
      render :json => { user_id: user.id }
    else
      render :status => :not_modified
    end
  end

  def show
    user = User.find_by(id: params[:id])
    rounds = user.closed_rounds
    render :json => { rounds: rounds }
  end

end
