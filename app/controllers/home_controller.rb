class HomeController < ApplicationController
  def index
    @q = Album.where(publish: true).ransack(params[:q])
    @albums = @q.result.includes(:tags)
  end
 
    def search
      index
      render :index
    end

  def show
    @album = Album.find(params[:id])
  end
end

