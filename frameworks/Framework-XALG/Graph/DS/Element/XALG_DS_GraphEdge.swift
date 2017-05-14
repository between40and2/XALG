//
//  XALG_DS_GraphEdge.swift
//  XALG
//
//  Created by Juguang Xiao on 10/15/15 (originally).
//

import Swift


class XALG_DS_GraphEdge<Vertex> : XALG_ADT_Edge
where Vertex : XALG_ADT_Vertex
{
    typealias VertexType = Vertex
    weak var graph: XALG_Rep_Graph<VertexType.VertexIdentifier>?
    
    var vertex_ = [VertexType]()
    
    var isDirected : Bool {
        return graph!.directed
    }
}



//class XALG_Rep_Edge<VType : XALG_ADT_Vertex> : XALG_ADT_Edge {
//    //    typealias ContentType = EdgeContentType
//    
//    //    typealias VertexType =
//    
//    
//}
//typealias XALG_Rep_Edge = XALG_DS_GraphEdge


class XALG_DS_GraphEdge_Weight<VertexType : XALG_ADT_Vertex, Weight : XALG_WeightType> : XALG_DS_GraphEdge<VertexType> {
    typealias WeightType = Weight
    var weight : WeightType! // = Weight(0.0)
}



