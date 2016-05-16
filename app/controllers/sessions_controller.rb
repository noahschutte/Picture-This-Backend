class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render :json => { id: @user.id }
    else
      # halt(403)
      render :status => :forbidden, :text => "Login failed"
    end
  end

end
