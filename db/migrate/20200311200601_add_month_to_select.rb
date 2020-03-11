class AddMonthToSelect < ActiveRecord::Migration[6.0]
  def change
    add_column :selections, :month, :string
  end
end
