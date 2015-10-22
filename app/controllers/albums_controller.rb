class AlbumsController < ApplicationController
  before_action :log_in

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash.now[:notice] = ["Created #{@album.name}"]
      render :show
    else
      flash[:errors]= @album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      flash.now[:notice] = ["Edited #{@album.name}"]
      render :show
    else
      flash[:errors]= @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    album = Album.find(params[:id])
    band_id = album.band_id
    album.destroy
    flash[:notice] = ["Deleted #{album.name}"]
    redirect_to band_url(band_id)
  end

  private
    def album_params
      params.require(:album).permit(:name, :band_id, :status, :lyrics)
    end
end
