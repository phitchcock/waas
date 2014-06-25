class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :user_id, index: true
      t.integer :idea_id, index: true

      t.timestamps
    end
  end
end
