class WikisController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wikis = Wiki.all
    @article = Article.new
    @collaborators = Collaborator.all
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.users << current_user

    authorize @wiki
    if @wiki.save
      redirect_to @wiki, notice: "#{@wiki.title} has been created!"
    else
      flash[:error] = "Wiki was not created, please try again"
      render :new
    end
  end

  def edit
    authorize @wiki
  end

  def update
    authorize @wiki
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: "#{@wiki.title} was updated!"
    else
      flash[:error] = "Wiki was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @wiki.destroy
      redirect_to user_path(current_user), notice: "#{@wiki.title} was destroyed!"
    else
      flash[:error] = "Wiki was not destroyed, please try again"
      redirect_to @wiki
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit!
  end

  def set_wiki
    @wiki = Wiki.friendly.find(params[:id])
  end
end