# Roles of types (protocls, structs, classes, enums)

This article defines the *roles* of XALG types, as well as their *responsibilities* and *skill set*

* *Role* is just a name or symbol to represent a collection of structurally likely types. Between roles, there are stable relationship, that keeps framework consistent and easy to use.
* *Responsibility* is the requirement, on both structural and functional, of a role.
* *Skill Set* refers to the developers' knowledge and skill capable to implement the *role* to fulfill its *responsibilities*. In iOS sense, it means the mastery of certain area of Apple frameworks. We have a serial of documents, called *SOP* (Standard Operation Procedure) for implementing each *Role*.

Here is the Table of Content for roles documents.

Framework | Role | XALG instance | Data Type| SOP
--|--|--|--|--
XALG|ADT| | protocol| [sop-adt](sop/sop-adt.md)
XALG|Rep/DS | | class/struct| [sop-rep](sop/sop-rep.md)
XALG|Algo| | class| [sop-algo](sop/sop-algo.md)
XALG|Error| [xalg-error.md](xalg-error.md)|enum|
XALG|Block| |typealias|
XALG-IO|Decoder in XALG-IO| | class|
XALG-IO|FSLoader in XALG-IO| | class |
XALG-Tests|Tests in XALG-Tests| | XCTestCase subclass|[sop-tests](sop/sop-tests.md)


## ADT (Abstract Data Type)

*ADT* is an abbreviation for [Abstract Data Type](https://en.wikipedia.org/wiki/Abstract_data_type).

ADTs are `protocol`s in Swift. *Collection* types (Stack, Queue, Tree, Graph, just name few) have *Element* types as `associatedtype`s.


### Identifier, Payload and Key

* Payload are opaque-to-algorithm data of Element. That means algorithms do NOT care on weather payload exists or what payload contents are.
* Key are algorithm-required data of Element. Usually Key are required to conform on [`Equatable`](https://developer.apple.com/reference/swift/equatable), [`Comparable`](https://developer.apple.com/reference/swift/comparable) or [`Hashable`](https://developer.apple.com/reference/swift/hashable).

## DS (Data Structure)

*DS* is short for [Data Structure](https://en.wikipedia.org/wiki/Data_structure) for a ADT. As you know, different representation for a same ADT has different properties in performance (e.g. some DS has higher time and space complexity) and use-case (e.g. some DS is for Directed Graph, but not for Undirected Graph) preference, we make each representation a class, which adopts it ADT protocol.

Some *DS* are made as `struct` while others as `class`. Swift generic is heavily used to ensure type safety.

*DS* was named as *Rep* for Representation for a ADT

### Implementation variants

One ADT can be represented in different form, hence implemented in even more ways. Some are implemented by internally using Swift standard library types, such as `Array`, `Set` and `Dictionary`

### Auxiliary data types

Some data types, such as `Path` as a sequence of nodes in Tree, or of vertices in Graph, are implemented as a *Rep* role, without a *ADT* definition.

## [Algo (Algorithm)](xalg-algo.md)

The implementation of an algorithm in particular flavors. For a ADT, such as Graph, there are some algorithms among it, such as DFS, BFS, topological sorting, etc. Instead of making an algorithm as a method of graph object, we make a class for each algorithm.

For a particular algorithm for a type, there may be several implementation, such as iterative vs recursive, that have different properties in performance and result. We make each implementation a class too.

### Comparison and Equality and Hashing

As seen in Identifier, Payload and Key section. This is applicable to Keys that an algorithms interact with its value. 

## [Error](xalg-error.md)

To (1) keep the system robust, and (2) communicate exceptions well with the user, we create a set of [`Error`](https://developer.apple.com/reference/swift/error) definitions regarding to algorithms, in the form of Swift `enum`s.

## Block

a set of `typealias` to define block/closure to represent the events and their data.

## Visit

For algorithms that do read-only traversals, for each accessing or processing a node or vertex, we call it a *visit*. And there is an object for that.

A *visit* must contain the object to be visited.

Optionally, a *visit* contain the info as by-product of algorithms, such as level of node, when doing `levelorder` traversal for binary trees.


## Tests in XALG-Tests

Responsibilities of Role Tests are the same as common Unit Testing.

For SOP for Tests, please see [sop/sop-tests.md](sop/sop-tests.md)

## XALG-IO

### Decoder

### FSLoader
