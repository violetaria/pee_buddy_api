class AddUserToRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :user, foreign_key: true, index: true
  end
end
