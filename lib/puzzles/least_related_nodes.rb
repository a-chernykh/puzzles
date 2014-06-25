module Puzzles
  class LeastRelatedNodes
    def initialize(graph)
      @graph = graph
    end

    def get
      pairs = []
      paths = {}

      @graph.get_nodes.each do |node|
        dijkstra = Algorithms::Dijkstra.new(@graph, node)
        paths[node.id] = dijkstra.shortest_paths
      end

      paths.each do |node1_id, p|
        p.each do |node2_id, d|
          node1 = @graph.find_node(node1_id)
          node2 = @graph.find_node(node2_id)
          if d == Float::INFINITY && !pairs.include?([node2, node1])
            pairs << [node1, node2]
          end
        end
      end

      pairs
    end
  end
end
