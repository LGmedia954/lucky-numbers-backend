class UserRoundSerializer
  include JSONAPI::Serializer
  attributes :id, :round_id, :user_id

end