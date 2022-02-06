class User < ApplicationRecord
  has_many :user_rounds, dependent: :destroy
  has_many :rounds, through: :user_rounds

  # has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

end