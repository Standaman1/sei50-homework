class MountainsController < ApplicationController


    def new
        @mountain = Mountain.new
    end #new - for blank form

    def index

        @mountains = Mountain.all

    end #index - of all mountains


    def show

        @mountain = Mountain.find params[:id]

    end #show - for singular mountain


    def create
        # render json: params

        Mountain.create(
            name: params[:mountain][:name],
            location: params[:mountain][:location],
            height: params[:mountain][:height],
            deaths: params[:mountain][:deaths],
            climbed: params[:mountain][:climbed],
            image_url: params[:mountain][:image_url]

        )

        redirect_to mountains_path
    
    end

    def edit
        @mountain = Mountain.find params[:id]

    end #edit

    def update
        mountain = Mountain.find params[:id]
        mountain.update(
            name: params[:mountain][:name],
            location: params[:mountain][:location],
            height: params[:mountain][:height],
            deaths: params[:mountain][:deaths],
            climbed: params[:mountain][:climbed],
            image_url: params[:mountain][:image_url]
        )

    redirect_to mountain_path(params[:id])
    end #update


    def destroy
        Mountain.destroy params[:id]
        redirect_to mountain_path
    end #destroy

end #class MountainsController