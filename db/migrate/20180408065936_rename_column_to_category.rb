class RenameColumnToCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :discription, :description
  end
end
