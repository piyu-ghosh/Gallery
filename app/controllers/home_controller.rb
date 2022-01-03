class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to albums_path
    else
    @q = Album.where(publish: true).ransack(params[:q])
    @albums = @q.result.includes(:tags)
    end
  end
 
    def search
      index
      render :index
    end

  def show
    @album = Album.find(params[:id])
  end
end

