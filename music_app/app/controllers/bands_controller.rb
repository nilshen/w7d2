class BandsController < ApplicationController
    # before_action :logged_in?, only:[:index, :show]

    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find(
        params[:id]
        )
    end
    
    def new
        @band = Band.new
        render :new
    end
    
    def create
        @band = Band.create(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def edit
        @band = Band.find(
        params[:id]
        )
        render :edit
    end
    
    def update
        # debugger
        @band = Band.find(
        params[:id]
        )
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        if @band.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to bands_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to bands_url
        end
    end
    

    def band_params
        params.require(:band).permit(:name)
    end
    
end
