class PhotosController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    @round = Round.find_by(id: params[:round_id])
    @photos = Photo.where(round_id: @round.id)
    # Erase this hard-coded example
    @photo = Photo.first
    submitted = []
    pending = []
    @round.participants.each do |participant|
      if participant.photos.find_by(round_id: @round.id)
        submitted << { id: participant.id, first_name: participant.first_name, photo: participant.photos.find_by(round_id: @round.id).image_url.to_s }
      else
        pending << { id: participant.id, first_name: participant.first_name, photo: "" }
      end
    end
    render :json => { participants: [submitted, pending] }
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    @round = Round.find_by(id: params[:round_id])

    render :json => {
      photo: { user_id: @photo.user.id, first_name: @photo.user.first_name, prompt: @photo.prompt.body, url: @photo.image_url }
    }
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
