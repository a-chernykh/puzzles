module Puzzles
  autoload :GraphLoader,        'puzzles/graph_loader'
  autoload :Graph,              'puzzles/graph'
  autoload :Node,               'puzzles/node'
  autoload :Edge,               'puzzles/edge'
  autoload :RelatedNodes,       'puzzles/related_nodes'
  autoload :MostRelatedNodes,   'puzzles/most_related_nodes'
  autoload :LeastRelatedNodes,  'puzzles/least_related_nodes'

  module Algorithms
    autoload :Dijkstra, 'puzzles/algorithms/dijkstra'
  end
end
