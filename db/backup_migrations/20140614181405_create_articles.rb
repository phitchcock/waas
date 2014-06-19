class Createscreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :title
      t.text :body
      t.belongs_to :idea

      t.timestamps
    end
  end
end
