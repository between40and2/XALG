
# XALG API: ADT Graph

## Scope

* Graph (directed and un-directed)
* XALG_ADT_Graph_Weighted
* Element
  * XALG_ADT_GraphNode
  * XALG_ADT_GraphVertex
  * XALG_ADT_GraphEdge


### Out Of Scope

* MultiGraph


## XALG_ADT_Graph


### Query for Vertex's Adjacent Edges and Vertices.

Items to Query/Return | Directed Graph | Non-Directed Graph
--|--|--
Vertex | adjecentVertex_  |
Vertex and Edge | <li> adjecentVertexEdgeTuple__out <li> func adjecentVertexEdgeTuple__in(forVertex v: VertexType) -> [(VertexType, EdgeType)] <li> func outEdgesAndVertices(forVertex v : VertexType) -> [(EdgeType, VertexType)] | adjecentVertexEdgeTuple_(forVertex v: VertexType) -> [(VertexType, EdgeType)]


### How to extend Vertex/Edge

You may notice there is a `var userInfo = [String: Any]()` in `XALG_DS_GraphVertex`. That is the extension point.

```swift
extension XALG_DS_GraphVertex {
    var center : CGPoint? {
        set {
            userInfo["center" ] = newValue
        }
        get {
            return userInfo["center"] as? CGPoint
        }
    }
}
```


### XALG_ADT_Graph


protocol|conformed
--|--
XALG_ADT_Graph|XALG_Rep_Graph
XALG_ADT_Graph_Weighted|XALG_Rep_Graph_Weighted

