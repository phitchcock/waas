class CollaboratorsController < ApplicationController

  # GET /wikis/123/collaborators
  #   collaborators#index
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
    @users = User.all
  end
  #   List of current_collaborators
  #   List of every other user
  #     link_to 'make collaborator', wiki_collaborators_path(@wiki, user_id: user.id), method: :post
  
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
  # POST /wikis/123/collaborators?user_id=234
  #   collaborators#create
  #   @wiki = Wiki.find(params[:wiki_id])
  #   @user = User.find(params[:user_id])
  #   current_user can do this
  #   Collaborator.create(wiki: @wiki, user: @user)

  # GET /wikis/123/edit
  #   current_user can do this

end