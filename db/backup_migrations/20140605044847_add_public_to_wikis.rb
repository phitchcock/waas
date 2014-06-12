class AddPublicToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :pubilc, :boolean, default: false
  end
end
