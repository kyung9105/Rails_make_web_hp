class SuggestionsController < ApplicationController
    
    def index
        @suggestion = Suggestion.all
    end
    
    def new
        @suggestion = Suggestion.new
    end
    
    def create
        @suggestion = Suggestion.new(post_params)
        if @suggestion.save
            redirect_to suggestions_path
        else 
            redirect_back
        end
        
    end
    
    def update
        @suggestion = Suggestion.find_by(id: params[:id])
        @suggestion.update(post_params)
        if @suggestion.save
            redirect_to suggestions_path
        else
            redirect_back
        end
    end
    
    def edit
        @suggestion = Suggestion.find_by(id: params[:id])
    end
    
    def show
        @suggestion = Suggestion.all
    end
    
    def destroy
        suggestion = Suggestion.find_by(id: params[:id])
        if suggestion.delete
            redirect_to suggestions_path
        end
    end
    
    private
    def post_params
      params.require(:suggestion).permit(:title, :content)
    end
end
