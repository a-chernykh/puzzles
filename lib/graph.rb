class Graph
  def add_node(node)
    nodes << node unless find_node(node.id)
  end

  def find_node(node_id)
    nodes.find { |node| node.id == node_id }
  end

  def add_edge(edge)
    edges << edge unless edge_exists?(edge)
  end

  def get_nodes
    nodes.freeze
  end

  def get_edges
    edges.freeze
  end

  private

  def edges
    @edges ||= []
  end

  def nodes
    @nodes ||= []
  end

  def edge_exists?(new_edge)
    edges.find { |edge| similar_edges?(edge, new_edge) }
  end

  def similar_edges?(edge1, edge2)
    edge1.node1_id == edge2.node1_id && edge1.node2_id == edge2.node2_id
  end
end
