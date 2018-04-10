class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :team, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
