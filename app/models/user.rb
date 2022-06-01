class User < ApplicationRecord
  has_many :rounds, optional: true

  validates :username, presence: true
  validates :email, presence: true

end