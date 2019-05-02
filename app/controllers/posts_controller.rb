class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :like]

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new(post_params)
    end

    def create
      @post = Post.create(post_params)
      @blogger = Blogger.find(@post.blogger_id)
      redirect_to @blogger
    end

    def update
      if get_post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

    # def like
    #     @post.likes = @post.likes+1
    #     @post.save
    #     render post_path(@post)
    #   end

    # def destroy
    #   @post = Post.find(params[:id])
    #   @blogger = Blogger.find(@post.blogger.id)
    #   @post.destroy
    #   redirect_to @blogger
    # end

    private

      def post_params
        params.permit(:title, :content, :likes, :blogger_id, :destination_id)
      end


      def get_post
        @post = Post.find(params[:id])
      end
end
