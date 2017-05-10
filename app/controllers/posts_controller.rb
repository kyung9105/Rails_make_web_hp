class PostsController < ApplicationController
    
    def index
        @post = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else 
            redirect_back
        end
        
    end
    
    def update
        @post = Post.find_by(id: params[:id])
        @post.update(post_params)
        if @post.save
            redirect_to root_path
        else
            redirect_back
        end
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
    end
    
    def show
        @post = Post.all
    end
    
    def destroy
        post = Post.find_by(id: params[:id])
        if post.delete
            redirect_to root_path
        end
    end
    
    private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
