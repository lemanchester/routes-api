class MapRoutePointsValidator < Struct.new(:map)

  def validate!(origin, destination)
    raise StandardError.new("This map does not contain #{origin} as a route") unless route_points.include?(origin)

    raise StandardError.new("This map does not contain #{destination} as a route") unless route_points.include?(destination)
    true
  end

  def route_points
    @points ||= map.route_points
  end

end
