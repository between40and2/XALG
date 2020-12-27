//
//  XALG_Rep_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 1/7/15 (oringally).
//

import Swift

class XALG_Rep_Graph<VertexIdentifier : Hashable> :  XALG_ADT_Graph {
    func edge_(on v: XALG_DS_GraphVertex<VertexIdentifier>) -> [XALG_DS_GraphEdge<VertexType>] {
        store_edge.edge_(on: v)
    }
    
    internal let store_edge = XALG_StoreImpl_GraphEdge<VertexIdentifier>()
    internal let store_vertex = XALG_StoreImpl_GraphVertex<VertexIdentifier>()
    
    
//    typealias VertexIdentifierType = VertexIdentifier
    typealias VertexType = XALG_DS_GraphVertex<VertexIdentifier>
    typealias EdgeType = XALG_DS_GraphEdge<VertexType>
    //    typealias VertexIdentifier = String
    
    var allows_addingEdge_samePairOfVertex = true {
        didSet {
            store_edge.allows_samePairOfVertex = allows_addingEdge_samePairOfVertex
        }
    }
    
    func addEdge(between v0: VertexType, and v1: VertexType) throws -> EdgeType? {
        
        let e = EdgeType(v0, v1)
//        e.vertex_ = [v0, v1]
        
        try store_edge.installEdge(e)
//        edge_.append(e)
        
        return e
    }
    
    func addEdge(from v0: VertexType, to v1: VertexType) throws -> EdgeType? {
        let e = EdgeType(v0, v1)
        try store_edge.installEdge(e)
        return e
    }
    
    var edge_ : [EdgeType] {   store_edge.edge_    }
    
    
    func addVertex(identifier ident: VertexIdentifier) throws -> VertexType {
        
        
        return try store_vertex.createVertex(identifier: ident)
//
//        let v = XALG_DS_GraphVertex<VertexIdentifierType>(ident)
//        //        v.identifier = ident
//
//        if set_vertexIdentifier.contains(ident) {
//            throw XALG_Error_Graph.addVertexWithDeplicateIdentifier
//        }
//
//        set_vertexIdentifier.insert(ident)
//
//        vertex_.append(v)
//        //        set_vertex.insert(v)
//
//        vertexIdent_vertex_[ident] = v
//
//        return v
    }

    
    var vertex_: [VertexType] { store_vertex.vertex_ }
    

    func vertex(identifier ident: VertexIdentifier) -> XALG_DS_GraphVertex<VertexIdentifier>? {
        store_vertex.vertex(identifier: ident)
    }
    
    
    
    
    private var _directed : Bool
    required init(directed: Bool = false ) {
        _directed = directed
//        vertex_ =  [VertexType]()
//        edge_ = [EdgeType]()
    }
    
    var directed: Bool { return _directed }
    

    //    var rootVertex_: [XALG_Rep_Vertex<VertexIdentifier>] {
    //        return []
    //    }
}

