class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :information
      t.belongs_to :user

      t.timestamps
    end
  end
end
