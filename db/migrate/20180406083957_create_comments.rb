class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false
      t.references :user, null: false
      t.text :content, null: false
      t.json :upload_file
      t.timestamps
    end
  end
end
