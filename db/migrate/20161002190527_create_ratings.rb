class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.float :rating, null: false
      t.references :rating_type, foreign_key: true
      t.references :location, foreign_key: true, index: true

      t.timestamps
    end
  end
end
