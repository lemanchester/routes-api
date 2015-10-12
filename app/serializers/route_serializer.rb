class RouteSerializer < ActiveModel::Serializer
  attributes :id, :origin, :destination, :distance
end
