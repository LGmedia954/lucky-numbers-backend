class User < ApplicationRecord
  has_many :rounds

  validates :email, presence: true
  validates :email, uniqueness: true

end