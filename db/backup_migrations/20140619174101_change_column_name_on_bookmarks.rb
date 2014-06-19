class ChangeColumnNameOnBookmarks < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :screen_id, :idea_id
  end
end
