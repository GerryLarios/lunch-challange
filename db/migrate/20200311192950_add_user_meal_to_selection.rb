class AddUserMealToSelection < ActiveRecord::Migration[6.0]
  def change
    add_reference :selections, :user, index: true
    add_reference :selections, :meal, index: true
  end
end
