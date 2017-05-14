//
//  XALG_ADT_Vertex.swift
//  XALG
//
//  Created by Juguang Xiao on 10/15/15 (originally).
//  Created by Juguang Xiao on 14/04/2017.
//

import Swift

protocol XALG_ADT_Vertex : Hashable {
    //    associatedtype ContentType
    associatedtype VertexIdentifier : Hashable
    
    //    associatedtype GraphType : XALG_ADT_Graph
    
    weak var graph :  //XALG_ADT_Graph?
        XALG_Rep_Graph<VertexIdentifier>?
        { get set }
    var identifier : VertexIdentifier { get }
}

extension XALG_ADT_Vertex {
    //    var inDegree : Int {
    //        return graph!.inDegree(forVertex:  self    )
    //    }
    
}

extension XALG_ADT_Vertex  {
    var hashValue: Int {
        return identifier.hashValue
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
