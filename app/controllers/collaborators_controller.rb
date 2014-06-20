class CollaboratorsController < ApplicationController

  def show
    @idea = Idea.friendly.find(params[:idea_id])
    @collaborators = @idea.collaborators.paginate(page: params[:page], per_page: 5)
    @non_collaborators = User.all # => joins(:collaborators).where('collaborators.idea_id <> ?', @idea.id)
    authorize @collaborators
  end

  def update
    @idea = Idea.friendly.find(params[:idea_id])
    @user = User.find(params[:user_id])
    
    @collaborator = Collaborator.find_or_initialize_by(idea_id: @idea.id, user_id: @user.id)

    @collaborator.role = params[:role]

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
    @user = User.find(params[:user_id])
    
    @collaborator = Collaborator.find_by(idea_id: @idea.id, user_id: @user.id)
   
    if @collaborator.destroy
      redirect_to idea_collaborators_path, notice: 'collaborator has been removed'
    else
      redirect_to @idea, error: 'collaborator was not removed'
    end
  end

end