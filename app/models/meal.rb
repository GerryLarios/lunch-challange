class Meal < ApplicationRecord
  has_one_attached :img
  has_one :selection
  validates :name, presence: true
  validates :img, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'] 
  validates_associated :selection
end
