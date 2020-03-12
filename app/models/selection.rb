class Selection < ApplicationRecord
  belongs_to :meal
  validates_presence_of [:meal_id]
  validates_presence_of [:user_id]
end
