//
//  XALG_Algo_Graph_Dijkstra.swift
//  XALG
//
//  Created by Juguang Xiao on 17/04/2017.
//

import Swift

// https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

class XALG_Algo_Graph_Dijkstra<G : XALG_ADT_Graph_Weighted> : XALG_Algo_Graph_SSSP<G> where G.VertexType : Hashable{
    
    //    typealias Vertex = UIView
    typealias Distance = Float
    typealias VertexIdentifierType = String // re-defined, overriding the superclass's
    
    private var pq : XALG_Rep_PriorityQueue__Heap<VertexType>!
    override init() {
        super.init()
        
        let sort = { (v0 :VertexType, v1:VertexType) -> Bool in
            return self.distance_[v0]! < self.distance_[v1]!
        }

        
        pq = XALG_Rep_PriorityQueue__Heap<VertexType>(sort : sort)
    }
    
    var processedVertex_ = Set<VertexType>()
    
    override func run() throws {
        initializeSingleSource()
        
        graph!.vertex_.forEach{
            pq.enqueue($0)
        }
        
        let g_w = graph! 
        
        while let u = pq.dequeue() {
            
            processedVertex_.insert(u)
            
            for (v, e) in graph!.adjecentVertexEdgeTuple_(forVertex: u) {
                
                if processedVertex_.contains(v) { continue}
                let e_w = e as! G.EdgeType_Weighted
                let w = g_w.weight(onEdge: e_w)
                
                relax(from: u, to: v, w: w)
//                processedVertex_.insert(v)
            }
            
        }
    }
    
    
}
