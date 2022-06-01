class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username

  # note this below caused 500 error upon sign in
  # has_many :user_rounds
  # has_many :rounds, through: :user_rounds

end