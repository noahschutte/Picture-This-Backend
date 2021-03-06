class PhotosController < ApplicationController

  def index
    round = Round.find_by(id: params[:round_id])
    render :json => {
      participants: {
        submitted: round.submitted_participants_formatted,
        pending: round.pending_participants_formatted
      }
    }
  end

  def show
    photo = Photo.find_by(id: params[:id])
    render :json => {
      photo: {
        user_id: photo.user.id,
        first_name: photo.user.first_name,
        prompt: photo.prompt.body,
        url: photo.image_url
      }
    }
  end

  def create
    round = Round.find_by(id: params[:round_id])
    photo = Photo.new(image: params[:image], round_id: round.id, user_id: params[:user_id], prompt_id: round.prompt.id)
    if photo.save
      render :json => { photo_id: photo.id }
    else
      render :status => :not_modified
    end
  end

end
