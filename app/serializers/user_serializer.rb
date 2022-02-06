class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :username, :email

  has_many :user_rounds
  has_many :rounds, through: :user_rounds
  
end