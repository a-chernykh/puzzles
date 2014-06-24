module Puzzles
  class LeastRelatedNodes
    include RelatedNodes

    private

    def collection
      @graph.nodes
    end
  end
end
