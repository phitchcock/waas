class AddRoleToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :role, :integer
  end
end
