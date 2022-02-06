class Game < ApplicationRecord
belongs_to :user
has_many :numbers, dependent destroy

end