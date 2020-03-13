class Meal < ApplicationRecord
  has_one_attached :img
  has_one :selection
  validates :name, presence: true
  validates :img, presence: true
  validates_associated :selection
end
