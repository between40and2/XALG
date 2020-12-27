//
//  XALG_ADT_Graph+ForVertex.swift
//  XALG
//
//  Created by Juguang Xiao on 26/03/2017.
//

import Swift

extension XALG_ADT_Graph { // query on adjecent
    
    func adjecentVertex_(for v: VertexType) -> [VertexType] {
        adjecentVertexEdgeTuple_(forVertex: v).map { return $0.0 }
    }
    
    
    func adjecentVertexEdgeTuple_(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        
        if self.directed {
            return adjecentVertexEdgeTuple__out(forVertex: v)
        }else {
            //            let a_in = adjecentVertexEdgeTuple__in(forVertex: v)
            //            let s_in = Set<(VertexType, EdgeType)>(a_in)
            //            let a_out = adjecentVertexEdgeTuple__out(forVertex: v)
            //            let s_out = Set<(VertexType, EdgeType)>(a_in)
            //            a_in.form
            /// FIXME
            // Fix me.... duplicate
            return adjecentVertexEdgeTuple__in(forVertex: v) + adjecentVertexEdgeTuple__out(forVertex: v)
        }
        
    }
    
}

extension XALG_ADT_Graph { // mutating
    
    func addEdge(between i0 : VertexIdentifierType, and i1 : VertexIdentifierType) throws -> EdgeType? {
        
        let v0 = try findOrCreateVertex(identifier: i0)
        let v1 = try findOrCreateVertex(identifier: i1)
        return try addEdge(between: v0, and: v1)
    }
    
    func addEdge(from i0 : VertexIdentifierType, to i1 : VertexIdentifierType) throws -> EdgeType? {
        let v0 = try findOrCreateVertex(identifier: i0)
        let v1 = try findOrCreateVertex(identifier: i1)
//        return try addEdge(from: v0, to: v1)
        return try addEdge(from: v0, to: v1)
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


extension XALG_ADT_Graph { // Query
    var rootVertex_ : [VertexType] {
        vertex_.filter { inDegree(forVertex:  $0) == 0 }
    }
    
    var leafVertex_ : [VertexType] {
        vertex_.filter { outDegree(forVertex: $0) == 0 }
    }
    
}
