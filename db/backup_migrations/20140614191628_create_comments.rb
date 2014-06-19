class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :info
      t.integer :user_id
      t.integer :screen_id

      t.timestamps
    end
  end
end
