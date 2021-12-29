class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = current_user.albums
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash[:notice] = "Album Created"
      redirect_to albums_path
    else
      render "new"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end

  def delete_image
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge # or use purge_later
    redirect_back(fallback_location: albums_url)
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :publish, :cover_image, :all_tags, images: [])
  end
end
