class ScreensController < ApplicationController

  before_action :set_idea
  before_action :set_screen, only: [:show, :edit, :update, :destroy]

  def index
    @screens = Screen.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @screen = Screen.new
  end


  def create
    @screen = @idea.screens.build(screen_params)

    if @screen.save
      @screen.create_activity :create, owner: @idea
      redirect_to idea_path(@idea), notice: 'Created screen'
    else
      flash[:error] = 'screen was not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @screen.update(screen_params)
      redirect_to idea_path(@idea), notice: 'screen updated'
    else
      render :edit
    end
  end

  def destroy
    if @screen.destroy
      redirect_to idea_screens_path, notice: 'screen destroyed'
    else
      render [@idea, @screen], notice: 'try again'
    end
  end

  private

  def screen_params
    params.require(:screen).permit!
  end

  def set_idea
    @idea = Idea.friendly.find(params[:idea_id])
  end

  def set_screen
    @screen = Screen.friendly.find(params[:id])
  end

end