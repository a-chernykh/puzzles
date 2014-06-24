module Puzzles
  module RelatedNodes
    def initialize(graph)
      @graph = graph
    end

    def get
      collection.lazy.map { |edge| node_pair(edge) }
    end

    private

    def node_pair(edge)
      [@graph.find_node(edge.node1_id), @graph.find_node(edge.node2_id), edge.weight]
    end
  end
end
