# XALG Designs



API Design is XALG differentiator from other open-source framework. To make a good design, the first step is to set design goals.


## Design Goals

* Extendable for Business-related contents, as tree's nodes or graph's vertices, are not limited to Int or String, but extendable to any Swift supported types.
* Extendable for algorithms. Take example of a Graph, there are several non-mutating algorithms around it, such as DFS, BFS, shortest path, etc. Each algorithms has its own internal data, which can be viewed as by-products for known usage. This design should respect the difference among algorithms, by make each algorithm as standalone (from the structure it processes) and dedicated (from another algorithm) class. You can access algorithm's properties at the end of execution, or get called back at interested events, and by setting breakpoints in your callbacks, you can pause algorithm execution.
  * One example on by-product would be, Graph's BFS can produce edge classification. For more details on this, please see [Lecture 13: Breadth-First Search (BFS)](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-13-breadth-first-search-bfs/) in [MIT OCW 6.006 Introduction to Algorithms](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/index.htm)
* Type safety in Swift.
* Instant use. Just include framework-XALG folder in your Xcode project, and you are ready to use. No other framework dependency.
* Neat interface. Some data are generated during algorithm as by-product. In some implementation, such data are placed in vertex or edge it associates, which does not make sense for other algorithms. In this design, algorithm will be standalone classes, instead of being graph's instance methods, and by-products of algorithm will be kept in algorithm object for use.
* Source code with running demos and sample data.
* UnitTest
* Robustness. Using Swift Error handling to communicate exception, rather than optional returns.
