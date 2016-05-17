class SessionsController < ApplicationController

  def get_user_id
    render :json => { id: session[:user_id], first_name: User.find(session[:user_id]).first_name }
  end

  def destroy
    session.clear
    render :json => { status: "Session has been cleared."}
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render :json => { id: @user.id }
    else
      render :status => :forbidden, :text => "Login failed"
    end
  end

end
