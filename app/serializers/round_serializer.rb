class RoundSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six
  set_type :round
  set_id :id
  
  belongs_to :user, if: Proc.new { |round, params| params && params[:id] == true }

end