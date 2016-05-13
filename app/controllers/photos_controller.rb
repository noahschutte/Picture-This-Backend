class PhotosController < ApplicationController

  def index
    @round = Round.find_by(id: params[:round_id])
    @photos = Photo.where(round_id: @round.id)
  end

  def show

  end

end
