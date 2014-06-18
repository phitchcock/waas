class BookmarksController < ApplicationController

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @article = Article.friendly.find(params[:article_id])
    @bookmarks = @article.bookmarks

    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit!)
    @bookmark.article = @article
    @new_bookmark = Bookmark.new

    if @bookmark.save
      flash[:notice] = 'comment created'
      redirect_to [@wiki, @article]
    else
      flash[:error] = 'try again'
      redirect_to [@wiki, @article]
    end

  end

end