class RemoveUserIdFromideas < ActiveRecord::Migration
  def change
    remove_column :ideas, :user_id
  end
end
