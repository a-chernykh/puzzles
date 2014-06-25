module Puzzles
  module Algorithms
    # https://github.com/brianstorti/ruby-graph-algorithms/tree/master/dijkstra adapted for undirected graphs
    class Dijkstra
      def initialize(graph, from_node)
        @graph     = graph
        @from_node = from_node
        @pq        = PriorityQueue.new
      end

      def shortest_paths
        max_out_distances
        distance_to[@from_node.id] = 0
        @pq.insert @from_node, 0

        while @pq.any?
          node = @pq.remove_min
          @graph.adjacent_edges(node).each do |adjacent_edge|
            relax(adjacent_edge)
            relax(mirror_edge(adjacent_edge))
          end
        end

        distance_to
      end

      private

      def mirror_edge(edge)
        Edge.new edge.node2_id, edge.node1_id, edge.weight
      end

      def distance_to
        @distance_to ||= {}
      end

      def max_out_distances
        @graph.get_nodes.each do |node|
          distance_to[node.id] = Float::INFINITY
        end
      end

      def relax(edge)
        return if distance_to[edge.node2_id] <= distance_to[edge.node1_id] + edge.weight
        distance_to[edge.node2_id] = distance_to[edge.node1_id] + edge.weight
        @pq.insert(@graph.find_node(edge.node2_id), distance_to[edge.node2_id])
      end

      class PriorityQueue
        def initialize
          @queue = {}
        end

        def any?
          @queue.any?
        end

        def insert(key, value)
          @queue[key] = value
          order_queue
        end

        def remove_min
          @queue.shift.first
        end

        private

        def order_queue
          @queue.sort_by {|_key, value| value }
        end
      end
    end
  end
end
