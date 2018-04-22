class AddNoteToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :note, :text
  end
end
