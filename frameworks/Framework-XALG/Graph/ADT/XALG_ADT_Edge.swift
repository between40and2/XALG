//
//  XALG_ADT_Edge.swift
//  XALG
//
//  Created by Juguang Xiao on 10/15/15 (originally).
//

import Swift


enum XALG_Enum_Graph_EdgeKindForVertex {
    case inEdge, outEdge, undirected
}

protocol XALG_ADT_Edge  : Hashable {
    associatedtype VertexType : XALG_ADT_Vertex
    
    var vertex_ : [VertexType] { get }
}

extension XALG_ADT_Edge {
    func anotherVertex(for v: VertexType) -> VertexType? {
    
        if vertex_[0] == v {
            return vertex_[1]
        }
        if vertex_[1] == v {
            return vertex_[0]
        }
        return nil
    }
}


extension XALG_ADT_Edge {
 
//    var hashValue: Int {
//        return vertex_[0].hashValue & vertex_[1].hashValue
//    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.vertex_[0] == rhs.vertex_[0] && lhs.vertex_[1] == rhs.vertex_[1]
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(vertex_[0])
        hasher.combine(vertex_[1])
    }
}
