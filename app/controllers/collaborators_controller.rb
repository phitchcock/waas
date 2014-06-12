class CollaboratorsController < ApplicationController

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
    @users = User.all
  end
  
  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    #current_user can do this

    @collaborator = Collaborator.new(wiki: @wiki, user: @user)
    if @collaborator.save
      redirect_to wiki_collaborators_path, notice: "Collaborator added!"
    else
      flash.now[:error] = "Collaborator did not save"
      render :new
    end
  end

  # GET /wikis/123/edit
  #   current_user can do this

end