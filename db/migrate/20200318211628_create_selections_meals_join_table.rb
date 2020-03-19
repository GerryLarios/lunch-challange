class CreateSelectionsMealsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :selections, :meals do |t|
      t.index :selection_id
      t.index :meal_id
    end
  end
end
