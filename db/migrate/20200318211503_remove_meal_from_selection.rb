class RemoveMealFromSelection < ActiveRecord::Migration[6.0]
  def change
    remove_column :selections, :meal_id
  end
end
