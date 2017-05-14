//
//  XALG_Rep_Graph_AdjacencyList.swift
//  XALG
//
//  Created by Juguang Xiao on 14/04/2017.
//


// 邻接表
class XALG_Rep_Graph_AdjacencyList <VertexIdentifier> : XALG_Rep_Graph<VertexIdentifier>
where VertexIdentifier : Hashable

{
    //    typealias VertexType = Vertex
    
    //    var vertexList = [Vertex]()
    
//    func adjecentVertexEdgeTuple_(forVertex v: Vertex) -> [(Vertex, Any)] {
//        
//        return [(v, "" as Any)]
//    }
    
    
    private var inVertex_edges_ = Dictionary<VertexType.VertexIdentifier, Array<EdgeType>>()
    
    
    override func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType {
        
        let in_edge_ = inVertex_edges_[ident] ?? []
        inVertex_edges_[ident] = in_edge_
        
//        if outVertex_edges_[ident] == nil {
//            outVertex_edges_[ident] = []
//        }

        let v = XALG_DS_GraphVertex<VertexIdentifierType>(ident)
        vertexIdent_vertex_[ident] = v
        return  v
    }

    
    override func addEdge(between v0: VertexType, and v1: VertexType) throws -> EdgeType? {

        let e = EdgeType()
        e.vertex_ = [v0, v1]
        
        inVertex_edges_[v0.identifier]?.append(e)
//        outVertex_edges_[v1.identifier]?.append(e)
        
        return e
    }
        private var vertexIdent_vertex_  = Dictionary<VertexIdentifierType, VertexType>()
    
    override var edge_: [EdgeType] {
        // https://developer.apple.com/reference/swift/array/1689788-flatmap
        get {
        return inVertex_edges_.values.flatMap {   return $0        }
        }
        set { fatalError() }
    }
    
    override var vertex_: [VertexType] {
        get {
            return inVertex_edges_.keys.map { return vertexIdent_vertex_[$0]! }
        }
        
            set {
                fatalError()
            }
    }
}


class XALG_Rep_Graph_AdjacencyList_bidirectional <VertexIdentifierType : Hashable> : XALG_Rep_Graph_AdjacencyList<VertexIdentifierType> {
    
    private var outVertex_edges_ = Dictionary<VertexType.VertexIdentifier, Array<EdgeType>>()
    
    
    override func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType {
        
        let v = try super.addVertex(identifier: ident)
        
//        let in_edge_ = inVertex_edges_[ident] ?? []
//        inVertex_edges_[ident] = in_edge_
        
        if outVertex_edges_[ident] == nil {
            outVertex_edges_[ident] = []
        }
        
//        let v = XALG_Rep_Vertex<VertexIdentifierType>(ident)
//        vertexIdent_vertex_[ident] = v
        return  v
    }
    
    
    override func addEdge(between v0: VertexType, and v1: VertexType) throws -> EdgeType? {
        
        if let e = try super.addEdge(between: v0, and: v1) {

            outVertex_edges_[v1.identifier]?.append(e)
        
            return e
        }
        return nil
    }
    
}


private class XALG_Rep_GraphEdgeList<G : XALG_ADT_Graph> {
    
//    var vertex : XALG_Rep_Vertex<IdentifierType: Hashable> : Optional<G.VertexType> = nil
    var edge_  = Array<G.EdgeType>()
    
    var inVertex_edges_ = Dictionary<G.VertexType.VertexIdentifier, Array<G.EdgeType>>()
    
    var outVertex_edges_ = Dictionary<G.VertexType.VertexIdentifier, Array<G.EdgeType>>()

    
}

struct ListUnit {
    var vertex : Int?
    var weight : Float?
    var next :  UnsafePointer<ListUnit>?  //  ListUnit?
}


