class Meal < ApplicationRecord
  has_one_attached :img
  has_one :selection
end
