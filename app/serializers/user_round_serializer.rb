class UserRoundSerializer
  include JSONAPI::Serializer
  attributes :id, :round_id, :user_id

  # # 500 error as we try to add round
  # # belongs_to :user
  # # belongs_to :round

end