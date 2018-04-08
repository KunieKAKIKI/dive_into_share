class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :category, null: false
      t.references :user, null: false
      t.string :title, null: false
      t.text :description
      t.string :image
      t.json :upload_file
      t.timestamps
    end
  end
end
