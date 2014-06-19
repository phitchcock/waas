class RemoveWikiIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :wiki_id
  end
end
