//
//  XALG_Algo_Graph_BellmanFord.swift
//  XALG
//
//  Created by Juguang Xiao on 25/04/2017.
//

import Swift

// https://en.wikipedia.org/wiki/Bellman–Ford_algorithm

// Redundant conformance constraint 'G.VertexType': 'Hashable'
class XALG_Algo_Graph_BellmanFord<G : XALG_ADT_Graph_Weighted> : XALG_Algo_Graph_SSSP<G> {
    
    override func run() throws {
        guard let g_w = graph else { throw XALG_Error_Graph_Algo.graphAbsent }

        let e_ = g_w.edge_
        
        initializeSingleSource()
        
        for _ in 0..<g_w.vertex_.count - 1 {
            var weightsUpdated = false
            e_.forEach{ (e) in
                let e_w = e as! G.EdgeType_Weighted
                let w = g_w.weight(onEdge: e_w)
                let from : G.VertexType = e_w.vertex_[0] as! G.VertexType
                let d_from = distance_[from]!
                
//                if d_from == G.WeightType.max { return  } // added
                
                let relaxedDistance = d_from + w
                let to = e_w.vertex_[1] as! G.VertexType
                let d_to = distance_[to]!
                if relaxedDistance < d_to { // can i use relax(,,)??
                    predecessor_[to] = from
                    distance_[to] = relaxedDistance
                    weightsUpdated = true
                }
            } // e_.forEach
            if !weightsUpdated { break }
        }
        
        ///
        for e in e_ {
            let e_w = e as! G.EdgeType_Weighted
            let from : G.VertexType = e_w.vertex_[0] as! G.VertexType
            let to = e_w.vertex_[1] as! G.VertexType
            
            if distance_[to]! > distance_[from]! + g_w.weight(onEdge: e_w) {
                throw  XALG_Error_Graph.hasNegativeWeightCycle
            }
        }
        
        
    }
    
}
//
//struct XALG_Result_Graph_BellmanFord <G: XALG_ADT_Graph_Weighted, T: Hashable, W: XALG_Addable> {
//    var predecessor_ = [T : T]()
//    var weight_ = [ T : W]()
//    var g : G?
//    
//    func distance(to : T) -> W? {
//        let d = weight_[to]
//        
//        guard d != W.max else { return nil }
//        return d
//        
//    }
//    
//    
//    func path(to : T) -> [T]? {
//        guard weight_[to] != W.max else { return nil }
//        
//        guard let p = recursePath(to: to, path: [to]) else { return nil }
//        
//        return p
//    }
//    
//    
//    private func recursePath(to : T, path: [T]) -> [T]? {
//        
//        guard let pred = predecessor_[to] else { return nil }
//        
//        if pred == to { return [to] }
//        
//        guard let p = recursePath(to: pred, path: path) else { return nil }
//        
//        return p + [to]
//    }
//}
