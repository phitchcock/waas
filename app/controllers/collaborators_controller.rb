class CollaboratorsController < ApplicationController

  def index
    @idea = Idea.friendly.find(params[:idea_id])
    @collaborators = @idea.collaborators.paginate(page: params[:page], per_page: 5)
    @non_collaborators = User.all # => joins(:collaborators).where('collaborators.idea_id <> ?', @idea.id)
    authorize @collaborators
  end
  
  def new
    @collaborator = Collaborator.new
    authorize @collaborator
  end

  def show
    @idea = Idea.friendly.find(params[:idea_id])
    @collaborator = Collaborator.find(params[:id])
    
    
  end

  def create
    @idea = Idea.friendly.find(params[:idea_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(idea: @idea, user: @user)
    authorize @collaborator

    if @collaborator.save
      redirect_to idea_collaborators_path(@idea) #, notice: "Collaborator added!"
    else
      flash[:error] = "Collaborator did not save"
      redirect_to [@idea, :collaborators]
    end
  end

  def destroy
    @idea = Idea.friendly.find(params[:idea_id])
    
    @collaborator = Collaborator.find(params[:id])
   
    if @collaborator.destroy
      redirect_to idea_collaborators_path, notice: 'collaborator has been removed'
    else
      redirect_to @idea, error: 'collaborator was not removed'
    end
  end

end