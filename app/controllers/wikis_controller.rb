class WikisController < ApplicationController

  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all 
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      redirect_to @wiki, notice: "#{@wiki.title} has been created!"
    else
      flash[:error] = "Wiki was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: "#{@wiki.title} was updated!"
    else
      flash[:error] = "Wiki was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @wiki.destroy
      redirect_to wikis_path, notice: "#{@wiki.title} was destroyed!"
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
    @wiki = Wiki.find(params[:id])
  end
end