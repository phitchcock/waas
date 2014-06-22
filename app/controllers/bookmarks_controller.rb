class BookmarksController < ApplicationController

  def create
    @idea = Idea.friendly.find(params[:idea_id])
    @bookmarks = @idea.bookmarks
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit!)
    @bookmark.idea = @idea
    #@new_bookmark = bookmark.new

    if @bookmark.save
      @bookmark.create_activity :create, owner: current_user
      flash[:notice] = 'bookmark created'
      redirect_to idea_path(@idea)
    else
      flash[:error] = 'try again'
      redirect_to idea_path(@idea)
    end
  end

end