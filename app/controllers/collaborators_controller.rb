class CollaboratorsController < ApplicationController

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
    @users = User.all
    authorize @collaborators
  end
  
  def new
    @collaborator = Collaborator.new
    authorize @collaborator
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(wiki: @wiki, user: @user)
    authorize @collaborator

    if @collaborator.save
      redirect_to wiki_collaborators_path, notice: "Collaborator added!"
    else
      flash.now[:error] = "Collaborator did not save"
      render :new
    end
  end

end