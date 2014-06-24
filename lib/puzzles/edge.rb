module Puzzles
  class Edge
    attr_reader :weight, :node1_id, :node2_id

    def initialize(node1_id, node2_id, weight)
      @node1_id = node1_id
      @node2_id = node2_id
      @weight = weight
    end
  end
end
