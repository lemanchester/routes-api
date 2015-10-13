class LowerCost
  include ActiveModel::SerializerSupport

  attr_reader :route, :cost

  def initialize(route, cost)
    @route = route
    @cost = cost
  end

end
