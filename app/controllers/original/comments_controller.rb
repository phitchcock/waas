class CommentsController < ApplicationController

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @article = Article.friendly.find(params[:article_id])
    @comments = @article.comments

    @comment = current_user.comments.build(params.require(:comment).permit!)
    @comment.article = @article
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = 'comment created'
      redirect_to [@wiki, @article]
    else
      flash[:error] = 'try again'
      redirect_to [@wiki, @article]
    end

  end

end