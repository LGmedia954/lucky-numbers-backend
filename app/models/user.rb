class User < ApplicationRecord
  has_many :user_rounds
  has_many :rounds, through: :user_rounds

  validates :email, presence: true
  validates :email, uniqueness: true

end