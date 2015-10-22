class BandsController < ApplicationController
  before_action :log_in

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash.now[:notice] = ["Created #{@band.name}"]
      render :show
    else
      flash[:errors]= @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      flash.now[:notice] = ["Edited #{@band.name}"]
      render :show
    else
      flash[:errors]= @band.errors.full_messages
      redirect_to edit_band_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Band.find(params[:id]).destroy
    flash[:notice] = ["Deleted #{@band.name}"]
    redirect_to bands_url
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
