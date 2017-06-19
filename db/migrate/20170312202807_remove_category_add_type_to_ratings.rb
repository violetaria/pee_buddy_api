class RemoveCategoryAddTypeToRatings < ActiveRecord::Migration[5.0]
  def change
    drop_table :rating_types
    remove_column :ratings, :category, :integer
    add_column :ratings, :rating_type, :integer
  end
end
