//
//  XALG_Algo_Graph_DFS.swift
//  XALG
//
//  Created by Juguang Xiao on 18/03/2017.
//

import Swift

// https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-14-depth-first-search-dfs-topological-sort/


class XALG_Algo_Graph_DFS<G : XALG_ADT_Graph>: XALG_Algo_Graph_Traversal_base<G> {
 

    private var visited_set = Set<VertexType>()
    
    override func recursive_forVertex(_ v: G.VertexType) {
        let visit = XALG_Visit_Vertex<VertexType>()
        visit.vertex = v
        visit.depth = _recursive_depth
        self.callback_visit?(visit)
        
        visited_set.insert(v)
        
        _recursive_depth += 1
        
        
        for (v1, _) in graph!.adjecentVertexEdgeTuple_(forVertex: v){
            
            if !visited_set.contains(v1) {
                recursive_forVertex(v1)
            }
            
        }
        
        
        _recursive_depth -= 1
    }
    
    
    
    override func iterative_forVertex(_ s: VertexType) -> Void
    {
    
        var stack = XALG_DS_Stack__Array<VertexType>()
        
        visited_set = Set<VertexType>()
        
        stack.push(s)
        
        while let u = stack.pop() {
            
            print(stack.item_.map{ $0.identifier})
            
            if !visited_set.contains(u) {
                visited_set.insert(u)
                
                //
                let visit = XALG_Visit_Vertex<VertexType>()
                visit.vertex = u
                self.callback_visit?(visit)
                
                for (v1, _) in graph!.adjecentVertexEdgeTuple_(forVertex: u) {
                    if !visited_set.contains(v1) { // add by impl. 17-524
                        stack.push(v1)
                    }
                }
            }
        }
        
    }
    
}
