class RemoveideaIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :idea_id
  end
end
