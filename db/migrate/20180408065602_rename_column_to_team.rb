class RenameColumnToTeam < ActiveRecord::Migration[5.1]
  def change
    rename_column :teams, :discription, :description
  end
end
