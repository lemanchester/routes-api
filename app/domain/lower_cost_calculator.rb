class LowerCostCalculator < Struct.new(:map)

  def calculate(options = {})
    validate!(options[:origin], options[:destination])

    route_path, distance = shortest_path(options[:origin], options[:destination])

    LowerCost.new(route_path.join(","), total_cost(distance, options[:autonomy], options[:liter_value]))
  end

  private

  def total_cost(distance, autonomy, liter_value)
    (distance / autonomy.to_f) * liter_value.to_f
  end

  def shortest_path(origin, destination)
    Graph.new(map.routes).shortest_path(origin, destination)
  end

  def validate!(origin, destination)
    MapRoutesPresenceValidator.new(map).validate!
    MapRoutePointsValidator.new(map).validate!(origin, destination)
  end

end
