class AddSlugToscreens < ActiveRecord::Migration
  def change
    add_column :screens, :slug, :string
    add_index :screens, :slug
  end
end
