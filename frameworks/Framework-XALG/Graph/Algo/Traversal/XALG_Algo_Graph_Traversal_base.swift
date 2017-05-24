//
//  XALG_Algo_Graph_Traversal_base.swift
//  XALG
//
//  Created by Juguang Xiao on 26/03/2017.
//

import Swift

class XALG_Algo_Graph_Traversal_base<G : XALG_ADT_Graph>: XALG_Algo_Graph_base<G> {
    var startVertex : VertexType?
    typealias VertexType = G.VertexType
    
    var callback_visit : ((XALG_Visit_Vertex<VertexType>) -> Void)?
    
    func travel() throws {
        guard graph != nil else { throw XALG_Error_Graph_Algo.graphAbsent }
        guard let v_s = startVertex else { throw XALG_Error_Graph_Algo.startVertexAbsent }
        
        if usesRecursion {
            recursive_forVertex(v_s)
        }else {
            iterative_forVertex(v_s)
        }
    }
    
    func recursive_forVertex(_ v: VertexType) -> Void
    {
        
    }
    
    func iterative_forVertex(_ v: VertexType) -> Void
    {
        
    }
    
    var usesRecursion : Bool = true
    internal var _recursive_depth : Int = 0
    
    var visit_ = [XALG_Visit_Vertex<VertexType>]()
    func handleVertex(_ v: VertexType, depth: Int) {
        
        let visit = XALG_Visit_Vertex<VertexType>()
        visit.vertex = v
        visit.depth = depth // vertex_distance_[v]!
        self.callback_visit?(visit)
        
        visit_.append(visit)
    }
    
    
}
