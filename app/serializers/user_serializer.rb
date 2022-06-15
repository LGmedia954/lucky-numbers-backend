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
    "http://localhost:3000/api/v1/users/#{user.id}/rounds"
  end

end