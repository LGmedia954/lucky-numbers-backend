class RoundSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six
  
  belongs_to :user, if: Proc.new { |round, params| params && params[:id] == true }

  set_id do |round, params|
    # in here, params is a hash containing the `:admin` key
    # params[:admin] ? movie.owner_id : "movie-#{movie.id}"
    params[:id] ? round.id : "#{round.id}"
  end

  link :personalized_url do |round, params|
    "http://localhost:3000/api/v1/users/#{user.id}/rounds/#{round.id}"
  end

end
