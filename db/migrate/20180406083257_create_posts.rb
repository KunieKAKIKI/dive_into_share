class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :category, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.json :upload_file
      t.timestamps
    end
  end
end
