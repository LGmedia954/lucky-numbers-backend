class User < ApplicationRecord
  has_many :rounds #, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true

end