# XALG - eXtendable ALGorithms

> Pure Swift Applied Algorithms for Engineers (not for Exam-Victims, Magicians, or Rocket Scientists)


## Scope

* Pure Swift code for common data structures and algorithms. (even not Foundation/Cocoa?)
* File-based storage/IO for data structures, mainly tree and graph. You need to save it for next time, no?
* relational database storage for data structures, in CoreData, Apple-provided frameworks of ORM.

### Out Of Scope

* UI presentation on data structures.
* Layout for data structures.
* ADT specific scope and features, such as multi-edge graph
* Very large scale of structures. (space and time performance is not guaranteed)
* No Apple frameworks(CoreFoundation, Accelerate, simd) involved.
  * See XALG-aOS, that is with Apple's OSes, e.g macOS, iOS, tvOS, watchOS.

## For hurried users

The rest of this article will discuss the design goals and principles that delivers primarily intent values, compared with other frameworks or projects.

If you are more interested in trying it out, please read [xx](), or checkout XALG Xcode project, in which the unit test cases cover the most of the usage of this framework.

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


## Design decisions


### Better Service, element object as business object carrier.

Vertex has 2 properties as below
```swift
var userInfo = [String: Any]()
var object : Any?
```
They are for convenience of app (or XALG's client), to carrier related objects with them. Algorithms are NOT supposed to read or write such data. If an algorithm needs extra informations, it should be the requirement explicit by defining a new protocols for element object.

### Vertex and Edge Identity

How can a vertex or edge be identified with identifier (such as String or Int)?

Should internal vertex object be a scalar or a struct or a class?



### Trade-off on simplicity and flexibility/rich-feature

Can simplicity be done with a bench of shortcuts/convenience methods?

## Summary

I wish you enjoy using this framework. If any suggestions, please let me know. 1847780@qq.com
