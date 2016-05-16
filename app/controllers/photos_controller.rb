class PhotosController < ApplicationController

  def index
    @round = Round.find_by(id: params[:round_id])
    submitted = []
    pending = []
    @round.participants.each do |participant|
      if participant.photos.find_by(round_id: @round.id)
        submitted << { id: participant.id, first_name: participant.first_name, photo: participant.photos.find_by(round_id: @round.id).image_url.to_s }
      else
        pending << { id: participant.id, first_name: participant.first_name, photo: "" }
      end
    end
    render :json => { participants: {submitted: submitted, pending: pending} }
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    render :json => { photo: { user_id: @photo.user.id, first_name: @photo.user.first_name, prompt: @photo.prompt.body, url: @photo.image_url } }
  end

  def create
    @round = Round.find_by(id: params[:round_id])
    @photo = Photo.create(image: params[:image], round_id: @round.id, user_id: params[:user_id], prompt_id: @round.prompt.id)
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :round_id, :prompt_id, :user_id)
  end
end
