class RoundSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six
  
  belongs_to :user

end