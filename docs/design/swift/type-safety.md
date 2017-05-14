


'override' modifier cannot be applied to this declaration

```swift
override typealias NodeType  = XALG_HuffmanTreeNode<PayloadType>
```

Also, there is NO concept as override super class's typealias in sub classes. So re-typealiasing in subclass does nothing useful or meaningful.


## Swift and Algorithms

Some algorithms, such as sorting and searching are supported in Swift.



Sorting and Searching are 2 fundemental algorithms. In Swift, protocols Equatable, Hashable, and Comparable, are important for sorting and searching.

 Comparable is related to sorting, natually.
 Equatable is related to searching. But with hashing searching of O(1) time complexity, Hashable is also important to implement.


Since we should support duplicate key for different record/payload, then Element should contain not only Key but also Payload to identify the business objects.

Payload should be opaque to algorithms. But Key should be either Comparable, or Equatable, Hashable according to algorithm it work with.


Concept: Element - Collection.

 Collection  | Element
 ---| ---
 Array,Stack, Queue | Element
 Tree | Node
 Graph | Vertex, Edge
