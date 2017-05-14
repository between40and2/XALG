//
//  XALG_ADT_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 10/12/15 (originally).
//

import Swift
protocol XALG_ADT_Graph: class {
    associatedtype VertexIdentifierType : Hashable
    associatedtype VertexType : XALG_ADT_Vertex
    associatedtype EdgeType : XALG_ADT_Edge
    
    init(directed: Bool) // Default argument not permitted in a protocol initializer
    //    var vertexList : [VertexType] { get set }
    
    func adjecentVertexEdgeTuple_(forVertex v : VertexType) -> [(VertexType, EdgeType)]
    
    var directed : Bool { get }
    
    var vertex_ : [VertexType] { get }
    var edge_  : [EdgeType] { get }
    
    func vertex(identifier ident : VertexIdentifierType )  -> VertexType?
    
    // Mutating
    
    func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType
    
    func addEdge(between v0 : VertexType, and v1 : VertexType) throws -> EdgeType?
    
}


extension XALG_ADT_Graph { // mutating
    
    func addEdge(between i0 : VertexIdentifierType, and i1 : VertexIdentifierType) throws -> EdgeType? {
        
        let v0 = try findOrCreateVertex(identifier: i0)
        let v1 = try findOrCreateVertex(identifier: i1)
        return try addEdge(between: v0, and: v1)
    }
    
    // this throws the same error set as addVertex.
    // if not found, then it is not regardedd as error, and add a new one. Therefore this will always return non-nil.
    //    func findOrCreateVertex(byIdentifier ident : VertexIdentifierType) throws -> VertexType
    func findOrCreateVertex(identifier ident: VertexIdentifierType) throws -> VertexType {
        
        if let v = vertex(identifier: ident){
            return v
        }
        return try addVertex(identifier: ident)
        
    }
}

extension XALG_ADT_Graph
//where VertexType == EdgeType.VertexType

{ // query only; read-only
        func edge(from v0 : VertexType, to  v1 : VertexType) -> EdgeType? {
        
        for e in edge_ {
            let vv0 = e.vertex_[0] as! VertexType
            let vv1 = e.vertex_[1] as! VertexType
            if vv0 == v0 && vv1 == v1 {
                return e
            }
        }
        
        return nil
    }
    
    ////////////
    func outEdgesAndVertices(forVertex v : VertexType) -> [(EdgeType, VertexType)] {
        let e_ = outEdges(forVertex: v)
        
        return e_.map { (e) -> (EdgeType, VertexType) in
            let v1 = e.vertex_[1] as! VertexType
            return (e, v1)
        }
        
    }
    
    func inDegree(forVertex v : VertexType) -> Int {
        return inEdges(forVertex: v).count
    }
    
    func outDegree(forVertex v : VertexType) -> Int {
        return outEdges(forVertex: v).count
    }
    
    var rootVertex_ : [VertexType] {
        return vertex_.filter {
            inDegree(forVertex:  $0) == 0
        }
    }
    
    var leafVertex_ : [VertexType] {
        return vertex_.filter {
            outDegree(forVertex: $0) == 0
        }
    }
    
}
