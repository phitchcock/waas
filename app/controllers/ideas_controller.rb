class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.paginate(page: params[:page], per_page: 10)
    authorize @ideas
  end

  def show
    @ideas = Idea.all
    #@screen = screen.new
    @collaborators = Collaborator.all
    @comment = Comment.new
    @bookmark = Bookmark.new
    authorize @idea
  end

  def new
    @idea = Idea.new
    authorize @idea
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.users << current_user
    # Collaborator.create(idea: @idea, current_user, role: 'admin')

    authorize @idea
    if @idea.save
      redirect_to @idea, notice: "#{@idea.title} has been created!"
    else
      flash[:error] = "Idea was not created, please try again"
      render :new
    end
  end

  def edit
    authorize @idea
  end

  def update
    authorize @idea
    if @idea.update(idea_params)
      redirect_to @idea, notice: "#{@idea.title} was updated!"
    else
      flash[:error] = "Idea was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @idea.destroy
      redirect_to user_path(current_user), notice: "#{@idea.title} was destroyed!"
    else
      flash[:error] = "Idea was not destroyed, please try again"
      redirect_to @idea
    end
  end

  private

  def idea_params
    params.require(:idea).permit!
  end

  def set_idea
    @idea = Idea.friendly.find(params[:id])
  end
end