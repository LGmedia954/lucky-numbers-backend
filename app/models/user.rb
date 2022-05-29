class User < ApplicationRecord
  has_many :rounds

  validates :username, presence: true
  validates :email, uniqueness: true

  def emailcheck
    if User.exists?(params[:email])
      @user = User.find(params[:email])
    end
  end

end