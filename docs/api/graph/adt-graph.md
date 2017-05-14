
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
