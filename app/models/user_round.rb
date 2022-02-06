class UserRound < ApplicationRecord
  belongs_to :user
  belongs_to :round

  def title
    self.round.title
  end

end