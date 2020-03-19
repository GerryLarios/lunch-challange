class Selection < ApplicationRecord
  MEALS_ALLOWED = 5

  has_and_belongs_to_many :meals
  belongs_to :user

  validates :month, presence: true, uniqueness: true
  validates :meals, presence: true
  validate :check_meals_number

  scope :enable, -> (user_id, month) { where('user_id = ? AND month = ?', user_id, month) }

  def check_meals_number
    errors.add(:meals, :invalid, message: "Only #{MEALS_ALLOWED} can be selected") unless number_meals_valid? 
  end

  private

  def number_meals_valid?
    self.meals.length <= MEALS_ALLOWED
  end
end
