class ChangeColumnNameOnBookmarks < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :article_id, :wiki_id
  end
end
