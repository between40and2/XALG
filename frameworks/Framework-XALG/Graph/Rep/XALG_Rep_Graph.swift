//
//  XALG_Rep_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 1/7/15 (oringally).
//

import Swift
class XALG_Rep_Graph<VertexIdentifier : Hashable> :  XALG_ADT_Graph {
    
    typealias VertexIdentifierType = VertexIdentifier
    typealias VertexType = XALG_DS_GraphVertex<VertexIdentifierType>
    typealias EdgeType = XALG_DS_GraphEdge<VertexType>
    //    typealias VertexIdentifier = String
    
    func addEdge(between v0: VertexType, and v1: VertexType) throws -> EdgeType? {
        
        let e = EdgeType()
        e.vertex_ = [v0, v1]
        
        edge_.append(e)
        
        return e
    }
    
    func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType {
        
        let v = XALG_DS_GraphVertex<VertexIdentifierType>(ident)
        //        v.identifier = ident
        
        if set_vertexIdentifier.contains(ident) {
            throw XALG_Error_Graph.addVertexWithDeplicateIdentifier
        }
        
        set_vertexIdentifier.insert(ident)
        
        vertex_.append(v)
        //        set_vertex.insert(v)
        
        vertexIdent_vertex_[ident] = v
        
        return v
    }
    
    
    var edge_: [EdgeType]
    
    var vertex_: [VertexType]
    
    private var vertexIdent_vertex_  = Dictionary<VertexIdentifierType, VertexType>()
    
    func vertex(identifier ident: VertexIdentifier) -> VertexType? {
        
        return vertexIdent_vertex_[ident]
    }
    
    private var _directed : Bool
    required init(directed: Bool = false ) {
        _directed = directed
        vertex_ =  [VertexType]()
        edge_ = [EdgeType]()
    }
    
    var directed: Bool { return _directed }
    
    private var set_vertex = Set<VertexType>()
    private var set_vertexIdentifier = Set<VertexIdentifier>()
    
    
    //    var rootVertex_: [XALG_Rep_Vertex<VertexIdentifier>] {
    //        return []
    //    }
}

