//
//  XALG_Error_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 14/04/2017.
//

import Swift

enum XALG_Error_Graph : Error {
    
    case undirectedGraph_addDuplicateEdge
    case undirectedGraph_addDuplicateEdgeInOppositeDirection
    
    case addVertexWithDeplicateIdentifier
    
    
    case hasCycle
    case hasNegativeWeightCycle
}

enum XALG_Error_Graph_Algo : Error {
    case notImplemented
    case graphAbsent
    case startVertexAbsent
}
