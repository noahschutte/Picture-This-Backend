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

  def new
    @photo = Photo.new()
  end

  def create
    binding.pry
    @photo = Photo.create!(photo_params)
    binding.pry
    # will need error message handling here
    redirect_to round_path(params[:round_id])
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :round_id, :prompt_id, :user_id)
  end
end
