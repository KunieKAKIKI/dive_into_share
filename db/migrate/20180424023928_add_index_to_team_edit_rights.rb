class AddIndexToTeamEditRights < ActiveRecord::Migration[5.1]
  def change
    add_index :team_edit_rights, [:user_id, :team_id], unique: true
  end
end
