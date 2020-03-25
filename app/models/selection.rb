class Selection < ApplicationRecord
  MEALS_ALLOWED = 5

  has_and_belongs_to_many :meals
  belongs_to :user

  validates :month, presence: true, uniqueness: true
  validates :meals, presence: true
  validate :check_meals_number

  after_commit :send_admin_email, on: [:create, :update]

  scope :enable, -> (user_id, month) { where('user_id = ? AND month = ?', user_id, month) }

  def check_meals_number
    errors.add(:meals, :invalid, message: "Only #{MEALS_ALLOWED} can be selected") unless number_meals_valid? 
  end

  def self.meals_allowed
    MEALS_ALLOWED 
  end

  def send_admin_email
    SelectionCompletedEmailJob.perform_now(self)
  end

  private

  def number_meals_valid?
    self.meals.length <= MEALS_ALLOWED
  end
end
