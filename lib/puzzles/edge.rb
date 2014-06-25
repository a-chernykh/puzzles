module Puzzles
  class Edge
    attr_reader :weight, :node1_id, :node2_id

    def initialize(node1_id, node2_id, weight)
      @node1_id = node1_id
      @node2_id = node2_id
      @weight = weight
    end

    def to_s
      "Edge #{@node1_id} - #{@node2_id} (#{weight})"
    end
  end
end
