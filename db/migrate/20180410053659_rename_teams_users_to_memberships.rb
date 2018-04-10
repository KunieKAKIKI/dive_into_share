class RenameTeamsUsersToMemberships < ActiveRecord::Migration[5.1]
  def change
    rename_table :teams_users, :memberships
  end
end
