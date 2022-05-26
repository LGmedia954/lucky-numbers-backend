class User < ApplicationRecord
  has_many :rounds, after_save :user_id

  validates :username, presence: true
  validates :email, uniqueness: true

end