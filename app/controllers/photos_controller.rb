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
    @round = Round.find_by(id: params[:round_id])
  end

  def create
    @photo = Photo.create!(photo_params)
    # will need error message handling here
    redirect_to round_path(params[:round_id])
  end

  def create
    @photo = Photo.create!(image: params[:image], round_id: params[:round_id], user_id: params[:user_id], prompt_id: params[:prompt_id])
    # will need error message handling here
    redirect_to round_path(params[:round_id])
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :round_id, :prompt_id, :user_id)
  end
end
