class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
      @band = Band.find_by(id: params[:id]) 
      @band.destroy
      redirect_to bands_url
  end

  def edit
    @band = Band.find_by(id: params[:id]) 
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band 
      @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = ["Could not find the band you referenced"]
      render :edit
    end
  
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id]) 
    render :show
  end

  private 

  def band_params
    params.require(:band).permit(:name)
  end
end
