lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'puzzles'

task :most_related do
  graph = load_graph
  most_related = Puzzles::MostRelatedNodes.new(graph).get.first(10)
  most_related.each do |pair|
    puts '%-60s %s' % [ [pair[0].name, 'and', pair[1].name].join(' '), '*' * pair[2].to_i ]
  end
end

task :least_related do
  graph = load_graph
  least_related = Puzzles::LeastRelatedNodes.new(graph).get(10).first(10)
  least_related.each do |pair|
    puts [ pair[0].name, 'and', pair[1].name ].join(' ')
  end
end

private

def load_graph
  graph_loader = Puzzles::GraphLoader.new("academia-ri-nodes.txt", "academia-ri-edges.txt")
  graph_loader.load
end
