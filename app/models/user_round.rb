class UserRound < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :round, optional: true
  # bypass errors on user create

end