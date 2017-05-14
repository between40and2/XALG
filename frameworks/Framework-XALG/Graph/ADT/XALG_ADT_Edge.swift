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

protocol XALG_ADT_Edge {
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
