
module Puzzles
  class MostRelatedNodes
    include RelatedNodes

    private

    def collection
      @graph.get_edges.sort_by { |edge| edge.weight }.reverse
    end
  end
end
