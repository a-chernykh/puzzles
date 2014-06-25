require 'pry'
require 'parallel'
require 'benchmark'

module Puzzles
  class LeastRelatedNodes
    def initialize(graph)
      @graph = graph
    end

    def get(count)
      pairs = []
      paths = {}

      nodes_without_connections_count = 0

      @graph.get_nodes.each do |node|
        dijkstra = Algorithms::Dijkstra.new(@graph, node)
        paths[node.id] = dijkstra.shortest_paths
        nodes_without_connections_count += paths[node.id].count { |_, v| v == Float::INFINITY }
        break if nodes_without_connections_count > count
      end

      paths.each do |node1_id, p|
        p.each do |node2_id, d|
          if d == Float::INFINITY
            node1 = @graph.find_node(node1_id)
            node2 = @graph.find_node(node2_id)
            pairs << [node1, node2] unless pairs.include?([node2, node1])
          end
        end
      end

      pairs
    end
  end
end
