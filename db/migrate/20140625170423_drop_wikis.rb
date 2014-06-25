class DropWikis < ActiveRecord::Migration
  def change
    drop_table :wikis
  end
end
