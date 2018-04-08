class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :team, null: false
      t.string :name, null: false
      t.text :discription
      t.string :image
      t.timestamps
    end
  end
end
