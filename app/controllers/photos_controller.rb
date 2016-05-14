class PhotosController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @round = Round.find_by(id: params[:round_id])
    @photos = Photo.where(round_id: @round.id)
    # Erase this hard-coded example
    @photo = Photo.first
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    # Erase this hard-coded example
    @round = Round.find_by(id: params[:round_id])
  end

  def post
    
  end
end
