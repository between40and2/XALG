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
    
    // 'weak' should not be applied to a property declaration in a protocol and will be disallowed in future versions
    var graph :  //XALG_ADT_Graph?
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
//    var hashValue: Int {
//        return identifier.hashValue
//    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
