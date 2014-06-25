class ChangeColumnDefaultideasToPublic < ActiveRecord::Migration
  def change
    change_column :ideas, :public, :boolean, default: true
  end
end
