class Round < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true

  scope :recent, -> { order(created_at: :desc) }

end