class UserRoundSerializer
  include JSONAPI::Serializer
  attributes :id, :round_id, :user_id
  
  # note this below caused 500 error upon sign in
  # belongs_to :user
  # belongs_to :round

end