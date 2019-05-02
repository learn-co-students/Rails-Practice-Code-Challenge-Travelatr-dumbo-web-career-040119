class BloggersController < ApplicationController
    before_action :get_blogger, only: [:show]

    def index
      @bloggers = Blogger.all
    end

    def new
      @blogger = Blogger.new(blogger_params)
    end

    def create
      @blogger = Blogger.new(blogger_params)
      if @blogger.save
        redirect_to
      else
        render :new
      end
    end

  private

    def blogger_params
      params.require(:blogger).permit(:name, :bio, :age)
    end

    def get_blogger
      @blogger = Blogger.find(params[:id])
    end

end
