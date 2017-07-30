class RemoveCategoryAddTypeToRatings < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :rating_type_id, :integer
    drop_table :rating_types
    add_column :ratings, :rating_type, :integer
  end
end
