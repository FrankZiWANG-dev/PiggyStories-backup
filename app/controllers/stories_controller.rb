class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  

  def create
    @story = Story.create(story_params)

    redirect_to stories_path
    
    private

    def stories_params
      params.require(:story).permit(:title, :pet, :content, :tldr)
    end
  end  
  
  def edit
  end
  
end
