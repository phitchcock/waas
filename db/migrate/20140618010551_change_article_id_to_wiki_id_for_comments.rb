class ChangeArticleIdToWikiIdForComments < ActiveRecord::Migration
  def change
    rename_column :comments, :article_id, :wiki_id
  end
end
