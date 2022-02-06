class UserRoundSerializer
  include JSONAPI::Serializer
  attributes :id, :round_id, :user_id
  
  belongs_to :user
  belongs_to :round

end