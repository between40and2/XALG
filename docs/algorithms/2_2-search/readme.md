
# Search.

## Search in Swift

In [`https://developer.apple.com/reference/swift/array`](https://developer.apple.com/reference/swift/array) .

[func index(of element: Element) -> Int?](https://developer.apple.com/reference/swift/array/1689674-index)

[func index(where predicate: (Element) throws -> Bool) rethrows -> Int?](https://developer.apple.com/reference/swift/array/1688966-index)

## Search in XALG

XALG has not designed nor implemented any algorithms for search yet.

You can choose to use Swift built-in search, or CoreData.

## Search in Textbooks

Category | Condition | |Average Case | Worst Case
--|--|--|--|--
Linear | Random | Sequential | O(N)
Linear | Ordered| Binary | O(lg N)
Hashing | | Hash Table | O(lg N)
Indexing | | Linear Indexing
Indexing| | Tree Indexing

## Linear search. O(N)

## Binary Search O(lg N)
If the array (random access is possible) is ordered by key, then linear binary search can be performed, by starting at the middle item and comparing it then moving to one side, recursively. Conceptually it is like working with binary tree, but the data structure is array, not tree.

## Hashing Search O(1)

Hashing the key of item into _address_ of item, so that it takes constant time O(1) to find the item by key.

A good number of implementations exist for searching for good reasons, as below:

* lookup/search time.
* storage/media constraint. Here we mainly talk about *B Trees*.

## Tree Index

Tree is for not only representing tree-like relationship of world/problem, but also speeding up searches.

* 2-3 Tree is a simple example of general B Tree, that is self-balancing, in turn good for searching.
* B Tree, a tree of node with N records and N+1 pointers to it children nodes.
* B+ Tree, is a variant of B Tree with File System access performance in mind.


### 2-3 Trees

http://pages.cs.wisc.edu/~vernon/cs367/notes/10.23TREE.html

https://en.wikipedia.org/wiki/AVL_tree

Self-balancing binary search tree


## Properties.

* Where the value are stored? in leaf only? or any node?
