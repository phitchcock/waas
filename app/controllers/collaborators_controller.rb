class CollaboratorsController < ApplicationController

  def index
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
    @non_collaborators = User.all # => joins(:collaborators).where('collaborators.wiki_id <> ?', @wiki.id)
    authorize @collaborators
  end
  
  def new
    @collaborator = Collaborator.new
    authorize @collaborator
  end

  def show
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    
    
  end

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(wiki: @wiki, user: @user)
    authorize @collaborator

    if @collaborator.save
      redirect_to wiki_collaborators_path(@wiki) #, notice: "Collaborator added!"
    else
      flash[:error] = "Collaborator did not save"
      redirect_to [@wiki, :collaborators]
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:wiki_id])
    
    @collaborator = Collaborator.find(params[:id])
   
    if @collaborator.destroy
      redirect_to wiki_collaborators_path, notice: 'collaborator has been removed'
    else
      redirect_to @wiki, error: 'collaborator was not removed'
    end
  end

end