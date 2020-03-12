class Meal < ApplicationRecord
  has_one_attached :img
  has_one :selection
  validates_presence_of [:name]
end
