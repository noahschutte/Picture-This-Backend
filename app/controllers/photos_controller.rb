class PhotosController < ApplicationController

  def index
    round = Round.find_by(id: params[:round_id])
    render :json => { participants: {submitted: Photo.submitted_participants(round), pending: Photo.pending_participants(round)} }
  end

  def show
    photo = Photo.find_by(id: params[:id])
    render :json => { photo: { user_id: photo.user.id, first_name: photo.user.first_name, prompt: photo.prompt.body, url: photo.image_url } }
  end

  def create
    round = Round.find_by(id: params[:round_id])
    photo = Photo.create(image: params[:image], round_id: round.id, user_id: params[:user_id], prompt_id: round.prompt.id)
  end

end
