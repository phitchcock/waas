class BookmarksController < ApplicationController

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @bookmarks = @wiki.bookmarks
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit!)
    @bookmark.wiki = @wiki
    #@new_bookmark = bookmark.new

    if @bookmark.save
      flash[:notice] = 'bookmark created'
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = 'try again'
      redirect_to wiki_path(@wiki)
    end
  end

end