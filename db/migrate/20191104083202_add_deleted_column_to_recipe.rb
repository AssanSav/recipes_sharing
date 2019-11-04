class AddDeletedColumnToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :deleted, :boolean, :default => false
  end
end
