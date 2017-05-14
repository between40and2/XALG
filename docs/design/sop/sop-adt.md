

ADT should be defined as protocol by nature.

ADT as a container of elements (for example, a Graph is a container of Vertices and Edges), it should have `associatedtype` to define elements' types.


Below is a matrix for Container and Element (think in Tree and TreeNode) in ADT and one of its representation.


x | Container (Tree) | Element (TreeNode)
--|--|--
ADT (protocol) | protocol A <br> associatedtype NodeType : B | protocol B <br> associatedtype NodeType : Self <br> associatedtype PayloadType
Rep (generic struct) | struct X\<Payload\> : A <br/> typealias NodeType = Y\<Payload\> |  struct Y\<Payload\> : B <br> typealias NodeType = Y\<Payload\> <br> typealias PayloadType = Payload

There are few basic principles here.

* A Container knows its Element.
* An Element may or may not know its belonged Container.
  * Usually, an Element does not know its belonged Container. That makes Element simple.
  * However, in some cases, an Element may need to know its context, e.g Container, to perform some operations. In such cases, and both are implemented in classes, Elements' reference to the container should be weak, in order to avoid retain cycle.
* Conformance-requirement for protocols' associatedtype, must be another protocol or Self. (Ex. `protocol A { associatedtype NodeType : B}` )
* typealias in class/struct related to associatedtype of its conforming protocol, must be of class/struct. (Ex. `struct X\<Payload\> : A { typealias NodeType = Y\<Payload\>}`) These 2 principles look very nature, but in practices people may forget them altogether.
