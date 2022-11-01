class PositionSerializer
  include JSONAPI::Serializer

  attributes :name, :created_at

  has_many :position_criterium_scores

end
