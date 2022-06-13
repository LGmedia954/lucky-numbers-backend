class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username

  set_id do |user, params|
    # in here, params is a hash containing the `:admin` key
    # params[:admin] ? movie.owner_id : "movie-#{movie.id}"
    params[:id] ? user.id : "#{user.id}"
  end

  # http://localhost:3000/api/v1/users/[object%20Object]/rounds 404 (Not Found)
  link :personalized_url do |user, params|
    "http://localhost:3000/api/v1/users/#{user.id}%20#{params[:user]}.*"
  end

  # note this below caused 500 error upon sign in
  # has_many :user_rounds
  # has_many :rounds, through: :user_rounds

  has_many :rounds, links: {
    self: :url,
    related: -> (object) {
      "http://localhost:3000/api/v1/users/#{user.id}/rounds/.*"
    }
  }

end