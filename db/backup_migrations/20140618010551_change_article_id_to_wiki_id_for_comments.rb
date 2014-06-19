class ChangescreenIdToideaIdForComments < ActiveRecord::Migration
  def change
    rename_column :comments, :screen_id, :idea_id
  end
end
