class TracksController < ApplicationController
  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash.now[:notice] = ["Created #{@track.name}"]
      render :show
    else
      flash[:errors]= @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      flash.now[:notice] = ["Edited #{@track.name}"]
      render :show
    else
      flash[:errors]= @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    track = Track.find(params[:id])
    album_id = track.album_id
    track.destroy
    flash[:notice] = ["Deleted #{@track.name}"]
    redirect_to album_url(album_id)
  end

  private
    def track_params
      params.require(:track).permit(:name, :album_id, :status, :lyrics)
    end
  end
