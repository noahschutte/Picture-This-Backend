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
    @photo = Photo.new(image: params[:image], round_id: params[:round_id], user_id: params[:user_id], prompt_id: params[:prompt_id])
    # Need control flow constraint on pressing submit without picture attached
    # will need error message handling here
    if @photo.save
      redirect_to round_path(params[:round_id])
    else

    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :round_id, :prompt_id, :user_id)
  end
end
