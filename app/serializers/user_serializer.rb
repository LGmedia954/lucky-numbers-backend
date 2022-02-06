class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username

  has_many :user_rounds
  has_many :rounds, through: :user_rounds

end