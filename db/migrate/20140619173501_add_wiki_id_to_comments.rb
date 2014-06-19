class AddWikiIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :wiki_id, :integer
  end
end
