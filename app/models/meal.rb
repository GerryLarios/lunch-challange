class Meal < ApplicationRecord
  belongs_to :user
  has_one_attached :img
  has_and_belongs_to_many :selections

  validates :name, presence: true
  validates :user, presence: true
  validates :img, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validate :check_user_admin

  def check_user_admin
    errors.add(:user, :invalid, message: 'Only admins can create meals') unless self.user&.admin?
  end
end
