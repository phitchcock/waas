class AddPublicToideas < ActiveRecord::Migration
  def change
    add_column :ideas, :public, :boolean, default: false
  end
end
