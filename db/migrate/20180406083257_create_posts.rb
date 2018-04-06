class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :category
      t.references :user
      t.string :title
      t.text :description
      t.string :image
      t.json :upload_file
      t.timestamps
    end
  end
end
