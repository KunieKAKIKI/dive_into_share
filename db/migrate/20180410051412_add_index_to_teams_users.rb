class AddIndexToTeamsUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :teams_users, [:team_id, :user_id], unique: true
  end
end
