class AnnouncesController < ApplicationController
    def index
        @announce = Announce.all
    end
    
    def new
        @announce = Announce.new
    end
    
    def create
        @announce = Announce.new(post_params)
        if @announce.save
            redirect_to announces_path
        else 
            redirect_back
        end
        
    end
    
    def update
        @announce = Announce.find_by(id: params[:id])
        @announce.update(post_params)
        if @announce.save
            redirect_to announces_path
        else
            redirect_back
        end
    end
    
    def edit
        @announce = Announce.find_by(id: params[:id])
    end
    
    def show
        @announce = Announce.all
    end
    
    def destroy
        announce = Announce.find_by(id: params[:id])
        if announce.delete
            redirect_to announces_path
        end
    end
    
    private
    def post_params
      params.require(:announce).permit(:title, :content)
    end
end
