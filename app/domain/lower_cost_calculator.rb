class LowerCostCalculator < Struct.new(:map)

  def calculate(options = {})
    validate!(options[:origin], options[:destination])
  end

  private

  def validate!(origin, destination)
    MapRoutesPresenceValidator.new(map).validate!
    MapRoutePointsValidator.new(map).validate!(origin, destination)
  end

end
