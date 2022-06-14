class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username

  set_id do |user, params|
    # in here, params is a hash containing the `:admin` key
    # params[:admin] ? movie.owner_id : "movie-#{movie.id}"
    params[:id] ? user.id : "#{user.id}"
  end

end