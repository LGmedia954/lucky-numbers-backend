class Round < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

end