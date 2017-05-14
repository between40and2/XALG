//
//  XALG_DS_GraphVertex.swift
//  XALG
//
//  Created by Juguang Xiao on 1/7/15 (oringally).
//

import Swift

class XALG_DS_GraphVertex<Identifier > : XALG_ADT_Vertex
    where Identifier : Hashable
{
    //    var identifier: IdentifierType
    
    
    typealias VertexIdentifier = Identifier
    
    //    typealias ContentType = VertexContentType
    
    weak var graph : XALG_Rep_Graph<Identifier>?
    
    fileprivate(set) var identifier: VertexIdentifier
    
    init(_ ident: VertexIdentifier) {
        identifier = ident
    }
    
    
    
    
    // carrier of business data, in 2 ways
    var userInfo = [String: Any]()
    var object : Any?
}
