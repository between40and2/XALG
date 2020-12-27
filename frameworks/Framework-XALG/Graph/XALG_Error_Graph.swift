//
//  XALG_Error_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 14/04/2017.
//

import Swift

enum XALG_Error_Graph : Error {
    
//    case undirectedGraph_addDuplicateEdge
//    case undirectedGraph_addDuplicateEdgeInOppositeDirection
    
    case addVertex_deplicateIdentifier
    
    // 20-c23
    case addEdge_samePairOfVertex
    
    case hasCycle
    case hasNegativeWeightCycle
    
    
    case defaultWeightMissing
    
    case directedGraph_callingAddEdgeBetweenAnd
    
    case undirectedGraph_callingAddFromTo
}



enum XALG_Error_Graph_Algo : Error {
    case notImplemented
    case graphAbsent
    case startVertexAbsent
}

class XALG_StoreImpl_GraphEdge<VertexIdentifier : Hashable>
//    : XALG_Hosting_GraphEdge
{
//    typealias VertexIdentifierType = VertexIdentifier
    typealias VertexType = XALG_DS_GraphVertex<VertexIdentifier>
    typealias EdgeType = XALG_DS_GraphEdge<VertexType>
    
    private var edge_bool = [EdgeType : Bool]()
    
    private(set) var edge_ = [EdgeType]()
    
    func installEdge(_ e : EdgeType) throws {
        
//        print("installEdge")
        if edge_bool[e] == nil {
            edge_.append(e)
            edge_bool[e] = true
            return
        }
        print("existing")
        if allows_samePairOfVertex {
            edge_.append(e)
        }else {
            throw XALG_Error_Graph.addEdge_samePairOfVertex
        }
    }
    
    var allows_samePairOfVertex = true {
        didSet {
            print(allows_samePairOfVertex, "allows_samePairOfVertex")
        }
    }
    
    
    func edge_(on v: VertexType) -> [EdgeType] {
        
        []
    }
    
}

class XALG_StoreImpl_GraphVertex<VertexIdentifier : Hashable> {
    
    typealias VertexType = XALG_DS_GraphVertex<VertexIdentifier>
    
    private(set) var vertex_: [VertexType] = [VertexType]()
    
    
    func createVertex(identifier ident: VertexIdentifier) throws -> VertexType {
        
        let v = XALG_DS_GraphVertex<VertexIdentifier>(ident)
        //        v.identifier = ident
        
        if set_vertexIdentifier.contains(ident) {
            throw XALG_Error_Graph.addVertex_deplicateIdentifier
        }
        
        set_vertexIdentifier.insert(ident)
        
        vertex_.append(v)
        //        set_vertex.insert(v)
        
        vertexIdent_vertex_[ident] = v
        
        return v
    }

    private var vertexIdent_vertex_  = Dictionary<VertexIdentifier, VertexType>()
    
    private var set_vertex = Set<VertexType>()
    private var set_vertexIdentifier = Set<VertexIdentifier>()
    
    func vertex(identifier ident: VertexIdentifier) -> VertexType? {
        
        return vertexIdent_vertex_[ident]
    }
    
}

extension XALG_StoreImpl_GraphVertex {
    func findOrCreateVertex(identifier ident: VertexIdentifier) throws -> VertexType {
        
        if let v = vertex(identifier: ident){
            return v
        }
        return try createVertex(identifier: ident)
        
    }
}
