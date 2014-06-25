require 'neography'
require 'pry'

$neo = Neography::Rest.new

def all_interests
  $neo.get_nodes_labeled 'ResearchInterest'
end

def most_related_interests
  $neo.execute_query <<-EOT
MATCH (n)-[r]->(x)
WHERE r.direction = "outgoing"
RETURN n.name, x.name, r.weight
ORDER BY r.weight DESC
LIMIT 10
EOT
end

def shortest_path(from_id, to_id)
  puts "#{from_id}->#{to_id}"
  $neo.execute_query <<-EOT
MATCH (ri1:ResearchInterest { id:#{from_id} }),(ri2:ResearchInterest { id:#{to_id} }),
  p = shortestPath((ri1)-[*..5]-(ri2))
RETURN p
EOT
end

def least_related_interests
  ids = all_interests.map { |ri| ri['data']['id'] }
  shortest_paths = {}
  ids.each do |id1|
    ids.each do |id2|
      shortest_path id1, id2 unless id1 == id2
    end
  end
end

puts least_related_interests['data']
