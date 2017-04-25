# Roles of types (protocls, structs, classes, enums)


## enum Error

To (1) keep the system robust, and (2) communicate exceptions well with the user, we create a set of errors regarding to algorithms.

## ADT

ADTs are protocols in Swift.

## Rep

*Rep* is short for Representation for a ADT. As you know, different representation for a same ADT has different properties in performance and use preference, we make each representation a class, which adopts it ADT protocol.

## Algo

The implementation of an algorithm in particular flavors. For a ADT, such as Graph, there are some algorithms among it, such as DFS, BFS, topological sorting, etc. Instead of making an algorithm as a method of graph object, we make a class for each algorithm.

For a particular algorithm for a type, there may be several implementation, such as iterative vs recursive, that have different properties in performance and result. We make each implementation a class too.


## Visit

For algorithms that do read-only traversals, for each accessing or processing a node or vertex, we call it a *visit*. And there is an object for that.

A *visit* must contain the object to be visited.

Optionally, a *visit* contain the info as by-product of algorithms, such as level of node, when doing `levelorder` traversal for binary trees.
