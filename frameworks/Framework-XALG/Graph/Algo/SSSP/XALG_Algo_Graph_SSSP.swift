//
//  XALG_Algo_Graph_SSSP.swift
//  XALG
//
//  Created by Juguang Xiao on 25/04/2017.
//

import Swift

class XALG_Algo_Graph_SSSP<G : XALG_ADT_Graph_Weighted> : XALG_Algo_Graph_base<G>
//where G.VertexType : Hashable
{
    
    typealias DistanceType = G.WeightType
    
    var sourceVertex : VertexType?
    
    // expected outputs
    var predecessor_ = [VertexType: VertexType?]()
    
    var distance_ = [VertexType: DistanceType]()
    
    // also called INITIALIZE-SINGLE-SOURCE(G, s)
    // was called setup()
    func initializeSingleSource() {
        let vs = sourceVertex!
        let g_w = graph! 
        
        for v in graph!.vertex_ {
            
            distance_[v]  = G.WeightType.max
            predecessor_[v] = nil
        }
        
        for e in graph!.outEdges(forVertex: vs) {
            let e_w = e as! G.EdgeType_Weighted
            let to = e_w.vertex_[1] as! G.VertexType
            
            distance_[to] = g_w.weight(onEdge: e_w)
            predecessor_[to] = vs
        }
        
        //        distance_[source!] = 0
        predecessor_[vs] = vs
        let zero : G.WeightType = G.WeightType.zero
        distance_[vs] = zero
    }
    
    func relax(from : VertexType, to : VertexType, w : DistanceType) {
        if distance_[to]! > distance_[from]! + w {
            distance_[to]!  = distance_[from]! + w
            predecessor_[to] = from
        }
        
    }

}

extension XALG_Algo_Graph_SSSP {
    func distance(to : VertexType) -> DistanceType? {
        let d = distance_[to]
        
        guard d != DistanceType.max else { return nil }
        return d
        
    }
    func path(to : VertexType) -> [VertexType]? {
        guard distance_[to] != DistanceType.max else { return nil }
        
        guard let p = recursePath(to: to, path: [to]) else { return nil }
        
        return p
    }
    private func recursePath(to : VertexType, path: [VertexType]) -> [VertexType]? {
        
        guard let pred = predecessor_[to] else { return nil }
        
        if pred == to { return [to] }
        
        guard let p = recursePath(to: pred!, path: path) else { return nil }
        
        return p + [to]
    }
}
