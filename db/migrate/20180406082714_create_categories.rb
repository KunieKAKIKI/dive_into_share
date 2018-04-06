class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :team
      t.string :name
      t.text :discription
      t.string :image
      t.timestamps
    end
  end
end
