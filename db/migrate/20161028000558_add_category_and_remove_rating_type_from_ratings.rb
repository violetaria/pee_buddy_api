class AddCategoryAndRemoveRatingTypeFromRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :category, :integer, default: 1
    remove_column :ratings, :rating_type_id
  end
end
