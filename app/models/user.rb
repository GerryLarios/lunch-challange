class User < ApplicationRecord
  has_many :meals
  has_many :selections
  has_secure_password
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  scope :admin_emails, -> { self.where(admin: true).pluck(:email) }
end
