# XALG - eXtendable ALGorithms

> Pure Swift Applied Algorithms for Engineers (not for Exam-Victims, Magicians, or Rocket Scientists)

## Motivation

As a software engineer, I experienced a big gap between the supply of algorithm from textbook or demo-like open-source and the demand on algorithm in projects, and decided to fill the gap.

The problems in projects are real and complicated with context. The payloads, the entities in topic, are objects that business-backed, rather than over-simplified integer. The key which is involved with algorithm in comparison can be different from the payload. Payloads with same keys are allowed to enter data structure. Just name a few, that the real problems that textbook data structure and algorithms are completely ignorant of.

## Scope

* Pure Swift code for common data structures and algorithms. (even not Foundation/Cocoa?)
* File-based storage/IO for data structures, mainly tree and graph. You need to save it for next time, no?
* Relational database storage for data structures, in CoreData, Apple-provided frameworks of ORM.

### Out Of Scope

* UI presentation on data structures.
* Layout for data structures.
* ADT specific scope and features, such as multi-edge graph
* Very large scale of structures. (space and time performance is not guaranteed)

## TOC of XALG project

* [frameworks](frameworks), home of Swift code that the users can just import them by folder into their own projects.
* projects, home for Xcode projects or playgrounds to demo the usage of XALG frameworks. Please look at the unit tests for usage.
* [docs](docs), rich set of docs to cover end-to-end of this project.
  * [algorithms](docs/algorithms), general knowledge on data structure and algorithms
  * [design](docs/design)
  * [api](docs/api), API and Usage


The rest of this article will discuss the design goals and principles that delivers primarily intent values, compared with other frameworks or projects.


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


## Contacts

I wish you enjoy using this framework. If any suggestions, please let me know. 1847780 at qq dot com
