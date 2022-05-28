class User < ApplicationRecord
  has_many :rounds

  validates :username, presence: true
  validates :email, uniqueness: true

end