class RemovePhotoFromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :photo
  end
end
