//
//  XALG_Rep_Graph_Weighted.swift
//  XALG
//
//  Created by Juguang Xiao on 18/04/2017.
//

import Swift

// 17-418
protocol XALG_ADT_Graph_Weighted : XALG_ADT_Graph {
    associatedtype WeightType : XALG_WeightType
    associatedtype EdgeType_Weighted : XALG_ADT_Edge
    func weight(onEdge e : EdgeType_Weighted) -> WeightType
    
    func addEdge(between v0 : VertexType, and v1 : VertexType, weight : WeightType) throws -> EdgeType_Weighted?
}


class XALG_Rep_Graph_Weighted<VertexIdentifier , Weight >
    : XALG_Rep_Graph<VertexIdentifier>,  XALG_ADT_Graph_Weighted
where VertexIdentifier : Hashable,
    Weight : XALG_WeightType
{
    
    typealias EdgeType_Weighted = XALG_DS_GraphEdge_Weight<VertexType, Weight>
    
    typealias WeightType = Weight
    
    func weight(onEdge e : EdgeType_Weighted) -> WeightType {
        return e.weight
    }
    
 
    var defaultWeight : WeightType!
    
    override func addEdge(between v0: VertexType, and v1: VertexType) throws -> EdgeType? {
        
        return try addEdge(between: v0, and: v1, weight: defaultWeight)
        
    }
    
    func addEdge(between v0 : VertexType, and v1 : VertexType, weight : WeightType) throws -> EdgeType_Weighted? {
        
        let e = EdgeType_Weighted()
        e.vertex_ = [v0, v1]
        e.weight = weight
        edge_.append(e)
        return e
    }
    
}

