class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredient
      t.text :process
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
