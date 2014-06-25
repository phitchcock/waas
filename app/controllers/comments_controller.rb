class CommentsController < ApplicationController

  def index
    @comments = Comment.hash_tree
  end
  
  # def create
  #   @idea = Idea.friendly.find(params[:idea_id])
  #   @comments = @idea.comments
  #   @comment = current_user.comments.build(params.require(:comment).permit!)
  #   @comment.idea = @idea
  #   #@new_comment = Comment.new

  #   if @comment.save
  #     flash[:notice] = 'comment created'
  #     redirect_to idea_path(@idea)
  #   else
  #     flash[:error] = 'try again'
  #     redirect_to idea_path(@idea)
  #   end
  # end

  def new
    @idea = Idea.friendly.find(params[:idea_id])
    @comment = Comment.new(parent_id: params[:parent_id])
  end


  def create
    @idea = Idea.friendly.find(params[:idea_id])
    #@comment = current_user.comments.new(params.require(:comment).permit!)
    #@comment.idea = @idea
    #@comment.user = current_user
    #@new_comment = Comment.new


    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(params.require(:comment).permit!)
      @comment.idea = @idea
      @comment.user = current_user
    else
      @comment = current_user.comments.build(params.require(:comment).permit!)
      @comment.idea = @idea
    end


    if @comment.save
      #@comment.create_activity :create, owner: current_user
      @comment.create_activity :create, owner: @idea

      flash[:notice] = 'comment created'
      redirect_to idea_path(@idea)
    else
      flash[:error] = 'try again'
      redirect_to idea_path(@idea)
    end
  end



  def up_vote
    #binding.pry
    @comment = Comment.find(params[:id])
    current_user.vote_for(@comment)
    respond_to do |format|
      format.js
    end
  end

end