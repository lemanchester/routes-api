class Graph
  Vertex = Struct.new(:name, :neighbours, :distance, :previous)

  # @param [Array<Route>] list of routes
  def initialize(routes)
    @vertices = Hash.new do |key, value|
      key[value] = Vertex.new(value, [], Float::INFINITY)
    end

    @edges = {}

    routes.each do |r|
      @vertices[r.origin].neighbours << r.destination
      @vertices[r.destination].neighbours << r.origin
      @edges[[r.origin, r.destination]] = @edges[[r.destination, r.origin]] = r.distance
    end

    @dijkstra_source = nil
  end

  def shortest_path(source, target)
    dijkstra(source)
    path = []
    u = target

    while u
      path.unshift(u)
      u = @vertices[u].previous
    end

    return path, @vertices[target].distance
  end

  private

  def dijkstra(source)
    return if @dijkstra_source == source

    queue = @vertices.values
    queue.each do |vertice|
      vertice.distance = Float::INFINITY
      vertice.previous = nil
    end

    @vertices[source].distance = 0

    until queue.empty?
      route = queue.min_by {|vertex| vertex.distance}
      break if route.distance == Float::INFINITY

      queue.delete(route)
      route.neighbours.each do |v|
        vertice = @vertices[v]
        if queue.include?(vertice)
          alt = route.distance + @edges[[route.name, v]]
          if alt < vertice.distance
            vertice.distance = alt
            vertice.previous = route.name
          end
        end
      end
    end

    @dijkstra_source = source
  end


end
