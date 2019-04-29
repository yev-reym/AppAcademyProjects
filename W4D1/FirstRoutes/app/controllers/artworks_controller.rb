class ArtworksController < ApplicationController 
    def index
    
        if !params[:artist_id].nil?
            @user = User.find(params[:artist_id])
            @artworks = @user.artworks
        else 
            @artworks = Artwork.all 
        end 
        
            render json: @artworks
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save  
            render json: @artwork
        else 
            render json: @artwork.errors.full_messages, status: 400
        end
    end

    def show
        @Artwork = Artwork.find(params[:id])
        render json: @Artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else 
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end
end