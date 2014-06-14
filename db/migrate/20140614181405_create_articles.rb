class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :information
      t.belongs_to :wiki

      t.timestamps
    end
  end
end
