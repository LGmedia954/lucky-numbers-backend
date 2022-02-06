class User < ApplicationRecord
has_many :games
has_many :numbers, through: :games

end