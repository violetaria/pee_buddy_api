class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :place_id, null: false, index: true
      t.float :lat, null: false
      t.float :lng, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
