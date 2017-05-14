//
//  XALG_Algo_Graph_BFS.swift
//  XALG
//
//  Created by Juguang Xiao on 18/04/2017. 10/14/15
//

import Swift
// https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-13-breadth-first-search-bfs/
class XALG_Algo_Graph_BFS<G : XALG_ADT_Graph>: XALG_Algo_Graph_Traversal_base<G> {

    override init() {
        super.init()
        usesRecursion = false // !!!
    }
    
    override func recursive_forVertex(_ v: G.VertexType) {
        fatalError("Not supported")
    }
    
    override func iterative_forVertex(_ v: VertexType) -> Void {
        var visited_set = Set<VertexType>()
        var queue = XALG_DS_Queue__Array<VertexType>()
        queue.enqueue(v)
        
        while let a = queue.dequeue() {
            print(queue.internalArray.map { $0.identifier })
            
            if visited_set.contains(a) { continue }
            
            let visit = XALG_Visit_Vertex<VertexType>()
            visit.vertex = a
            self.callback_visit?(visit)
//            visited_set.insert(a)
            
            for (v1, _) in graph!.adjecentVertexEdgeTuple_(forVertex: a) {
                if !visited_set.contains(v1) {
                    queue.enqueue(v1)
                }
            }
            
            visited_set.insert(a)
        }
    }
}

