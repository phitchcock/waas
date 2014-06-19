class CommentsController < ApplicationController

  
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @comments = @wiki.comments
    @comment = current_user.comments.build(params.require(:comment).permit!)
    @comment.wiki = @wiki
    #@new_comment = Comment.new

    if @comment.save
      flash[:notice] = 'comment created'
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = 'try again'
      redirect_to wiki_path(@wiki)
    end
  end

end