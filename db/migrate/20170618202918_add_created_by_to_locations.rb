class AddCreatedByToLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :created_by, index: true
  end
end
