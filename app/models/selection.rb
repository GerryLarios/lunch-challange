class Selection < ApplicationRecord
  has_and_belongs_to_many :meals
  belongs_to :user

  validates :month, presence: true, uniqueness: true
  
  scope :enable, -> (user_id, month) { where('user_id = ? AND month = ?', user_id, month) }
end
