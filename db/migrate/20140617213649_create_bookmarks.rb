class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.belongs_to :article
      t.belongs_to :user

      t.timestamps
    end
  end
end
