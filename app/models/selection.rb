class Selection < ApplicationRecord
  belongs_to :meal
  validates :month, presence: true
end
