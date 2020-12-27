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
    
    private(set) var vertex_ = [VertexType]()
    
    required init(_ a : VertexType, _ b : VertexType) {
        vertex_ = [a, b]
    }
    
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


class XALG_DS_GraphEdge_Weight<VertexType, Weight>
    : XALG_DS_GraphEdge<VertexType>
where
    VertexType : XALG_ADT_Vertex,
    Weight : XALG_WeightType
{
    typealias WeightType = Weight
    var weight : WeightType // = Weight(0.0)
    
    init(_ a : VertexType, _ b: VertexType, weight w : WeightType) {
        weight = w
        super.init(a, b)
    }
    
    required init(_ a: VertexType, _ b: VertexType) {
        fatalError("init(_:_:) has not been implemented")
    }
}


// 20-c23
class XALG_DS_GraphEdge_Extra<VertexType, Payload> : XALG_DS_GraphEdge<VertexType>
where VertexType : XALG_ADT_Vertex
{
    
    var payload : Payload
    init(_ a : VertexType, _ b: VertexType, payload p : Payload) {
        payload = p
        super.init(a, b)
    }
    
    required init(_ a: VertexType, _ b: VertexType) {
        fatalError("init(_:_:) has not been implemented")
    }
    
}
