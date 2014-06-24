require 'graph'
require 'node'
require 'edge'
require 'open-uri'
require 'csv'

class GraphLoader
  def initialize(nodes_path, edges_path)
    @nodes_path = nodes_path
    @edges_path = edges_path
    @graph = Graph.new
  end

  def load
    load_nodes
    load_edges
    @graph
  end

  private

  def load_edges
    open_and_parse(@edges_path) do |row|
      edge = Edge.new row[0].to_i, row[1].to_i, row[2].to_f
      @graph.add_edge edge
    end
  end

  def load_nodes
    open_and_parse(@nodes_path) do |row|
      node = Node.new row[0].to_i, row[1]
      @graph.add_node node
    end
  end

  def open_and_parse(url)
    contents = open url
    CSV.parse(contents, col_sep: "\t", headers: true) do |row|
      yield row
    end
  end
end
