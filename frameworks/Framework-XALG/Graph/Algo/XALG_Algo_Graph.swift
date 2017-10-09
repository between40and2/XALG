//
//  XALG_Algo_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 12/04/2017.
//

import Swift

class XALG_Algo_Graph_base<GraphType : XALG_ADT_Graph > {

    typealias VertexType =  GraphType.VertexType //  XALG_Rep_Vertex<VertexContentType>
    var graph : GraphType? // Cannot use XALG_ADT_Graph
    
    func run() throws {
        throw XALG_Error_Graph_Algo.notImplemented
    }
    
    var callback_round : ((Int) -> Void)?
    var callback_complete : (() ->Void)?
    
}

