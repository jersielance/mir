class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def create
    params[:picture]['picture'].each do |a|
      Picture.create(picture: a)
    end
    redirect_to root_path
  end
end
