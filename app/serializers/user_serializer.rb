class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username

  set_id do |user, params|
    # in here, params is a hash containing the `:id` key
    params[:id] ? user.id : "user-#{user.id}"
  end

  # note this below caused 500 error upon sign in
  # has_many :user_rounds
  # has_many :rounds, through: :user_rounds

end