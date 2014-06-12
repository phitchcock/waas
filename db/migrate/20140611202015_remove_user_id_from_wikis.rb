class RemoveUserIdFromWikis < ActiveRecord::Migration
  def change
    remove_column :wikis, :user_id
  end
end
