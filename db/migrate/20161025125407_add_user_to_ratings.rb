class AddUserToRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :user, index: true, null: false
  end
end
