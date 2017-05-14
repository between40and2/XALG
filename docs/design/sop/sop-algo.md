# SOP for Algo role

## XALG_Algo_Graph_base

First of all, there must be an object to be operated upon. For Graph, it is a graph; for Tree, it could be a root node, or a tree object.

Since ADT system is a generic system, so is Algo, that is, it is generic on the object. Here are some examples:

* `class XALG_Alg_Graph_base<GraphType : XALG_ADT_Graph >`



It is wrong be like this.
```swift
 typealias VertexType = XALG_Rep_Vertex<VertexContentType>
 typealias GraphType = XALG_Rep_Graph<VertexContentType>
```

Since that has not express the relationship between Vertex and Graph. They may be in different Graph but happens to have same IdentifierType.
The current *order* is Graph first, then VertextType is derived from GraphType as GraphType.VertexType

Now, GraphType should be generic, and can adopt XALG_ADT_Graph, rather than XALG_Rep_Graph.



Do:

```swift
typealias NodeType =  TreeType.NodeType
```

Don't
```swift
typealias NodeType =  XALG_Rep_TreeNode_KaryTree<TreeType>
```
