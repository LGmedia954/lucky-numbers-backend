class RoundSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six
  set_type :round
  set_id :id
  
  belongs_to :user, if: Proc.new { |round, params| params && params[:id] == true }

  # http://localhost:3000/api/v1/users/[object%20Object]/rounds 404 (Not Found)
  link :personalized_url do |user, params|
    "http://localhost:3000/api/v1/users/#{user.id}/rounds"
  end

end



# example
# link :personalized_url do |object, params|
#   "https://movies.com/#{object.name}-#{params[:user].reference_code}"
# end