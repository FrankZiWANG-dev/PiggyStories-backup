class StoriesController < ApplicationController
  before_action :current_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def show

  end

  def new
    @story = Story.new
  end

  def create
    story = Story.create(story_params)

    redirect_to stories_path
  end    

  def edit

  end

  def update
    @story.update(story_params)

    redirect_to story_path(@story)
  end
 
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :pet, :content, :tldr)
  end

  def current_story
    @story = Story.find(params[:id])
  end


end
