//
//  XALG_Algo_Graph_LevelBFS.swift
//  XALG
//
//  Created by Juguang Xiao on 24/05/2017.
//
import Swift

class XALG_Algo_Graph_LevelBFS<G>: XALG_Algo_Graph_Traversal_base<G> where G : XALG_ADT_Graph {

    class Level {
        var queue = XALG_DS_Queue__Array<G.VertexType>()
        var index : Int = 0
    }
    
    override func iterative_forVertex(_ v: VertexType) -> Void {
        
        
    
    }
    
}
