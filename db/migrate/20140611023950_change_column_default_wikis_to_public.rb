class ChangeColumnDefaultWikisToPublic < ActiveRecord::Migration
  def change
    change_column :wikis, :pubilc, :boolean, default: true
  end
end
