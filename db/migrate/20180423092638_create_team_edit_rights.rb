class CreateTeamEditRights < ActiveRecord::Migration[5.1]
  def change
    create_table :team_edit_rights do |t|
      t.references :team, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
