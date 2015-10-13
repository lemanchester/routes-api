class MapRoutesPresenceValidator < Struct.new(:map)

  def validate!
    raise StandardError.new("This map does not contain any routes registered") if map.routes.empty?
  end

end
