class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render :json => { id: @user.id }
    else
      render :status => :forbidden
    end
  end

end
