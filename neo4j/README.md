# Import files to Neo4j

Neo4j does not understands custom CSV separators. We need to convert tabs to commas first:

```bash
curl https://s3.amazonaws.com/academia.edu.puzzles/academia-ri-nodes.txt|tr "\t" "," > academia-ri-nodes.csv
curl https://s3.amazonaws.com/academia.edu.puzzles/academia-ri-edges.txt|tr "\t" "," > academia-ri-edges.csv
```

I've uploaded output files produces by above command to my Dropbox:

* https://dl.dropboxusercontent.com/u/357151/academia.edu/academia-ri-nodes.csv
* https://dl.dropboxusercontent.com/u/357151/academia.edu/academia-ri-edges.csv

## Clean database

```
MATCH (n)
OPTIONAL MATCH (n)-[r]-()
DELETE n,r
```

## Load nodes

```
LOAD CSV WITH HEADERS FROM "https://dl.dropboxusercontent.com/u/357151/academia.edu/academia-ri-nodes.csv" AS csvLine
CREATE (ri:ResearchInterest { id: toInt(csvLine.node_id), name: csvLine.research_interest })
```

## Load relations

```
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "https://dl.dropboxusercontent.com/u/357151/academia.edu/academia-ri-edges.csv" AS csvLine
MATCH (ri1:ResearchInterest { id: toInt(csvLine.source_id)}),(ri2:ResearchInterest { id: toInt(csvLine.target_id)})
CREATE (ri1)-[:RELATED { weight: toFloat(csvLine.weight), direction: "outgoing" }]->(ri2)
CREATE (ri2)-[:RELATED { weight: toFloat(csvLine.weight), direction: "incoming" }]->(ri1)
```
