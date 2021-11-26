class User < ApplicationRecord
  has_many :students
  has_many :professors

  VALID_OSU_EMAIL = /[a-zA-Z]+\.[0-9]+@[oO][sS][uU]\.[eE][dD][uU]/

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_OSU_EMAIL }, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
  has_secure_password
end
