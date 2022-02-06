class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :username, :email

  has_many :games
  has_many :numbers, through: :games
end
