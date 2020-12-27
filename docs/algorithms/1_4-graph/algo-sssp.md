
### SSSP (Single Source Shortest Path)

There are at least 2 classic algorithms for that.

name|feature|condition of use
--|--|--
[Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)|
[Bellman–Ford algorithm](https://en.wikipedia.org/wiki/Bellman–Ford_algorithm)|



#### base class

Unless it is a graph generation algorithm, it requires a graph as input.

```swift
class XALG_Alg_Graph_base<GraphType : XALG_ADT_Graph > {

var graph : GraphType? // Cannot use XALG_ADT_Graph
```


## SSSP

The graph should be weighted.

Besides a graph, a start/source vertex needs to be given.

### Outputs

There are 2 kinds of outputs.

* direct/raw outputs from algorithm
  * `var predecessor_ = [VertexType: VertexType?]()`
  * `var distance_ = [VertexType: DistanceType]()`
* derived by direct/raw outputs (defined in extension)
  * `func distance(to : VertexType) -> DistanceType?`
  * `func path(to : VertexType) -> [VertexType]?`


## [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)



## [Bellman–Ford algorithm](https://en.wikipedia.org/wiki/Bellman–Ford_algorithm)


* [GeeksforGeeks : Dynamic Programming | Set 23 (Bellman–Ford Algorithm)](http://www.geeksforgeeks.org/dynamic-programming-set-23-bellman-ford-algorithm/)
* [C++ Program to Use the Bellman-Ford Algorithm to Find the Shortest Path Between Two Vertices Assuming that Negative Size Edges Exist in the Graph](http://www.sanfoundry.com/cpp-program-use-bellman-ford-algorithm-find-shortest-path-between-two-vertices-assuming-that-negative-size-edges-exist-graph/)
