
# XALG API: Algorithms of Graph

## Scope - Status

* DFS
* BFS
* TopologicalSort
  * Queue
  * DFS
* CP (Critical Path)
* SSSP (Single-Source Shortest Path)
  * Dijkstra
  * BellmanFord
* MST (minimum Spanning Tree) - Not Started


## Tips

Some algorithms requires an array of visited nodes, using ` var visited_ : Array<GraphType.VertexType>!`. It is better for performance to use Set instead, like `private var visited_set = Set<VertexType>()`, which's time complexity is O(1), and you must make VertexType as `Hashable`.
