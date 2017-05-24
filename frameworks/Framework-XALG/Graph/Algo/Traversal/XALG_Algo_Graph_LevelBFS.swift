//
//  XALG_Algo_Graph_LevelBFS.swift
//  XALG
//
//  Created by Juguang Xiao on 24/05/2017.
//
import Swift

class XALG_Algo_Graph_LevelBFS<G>: XALG_Algo_Graph_Traversal_base<G> where G : XALG_ADT_Graph {

    override init() {
        super.init()
        usesRecursion = false 
    }
    
    class Level {
        var queue = XALG_DS_Queue__Array<G.VertexType>()
        var index : Int = 0
        
        init(index i: Int) {
            index = i
        }
    }
    var level_ = [Level]()
    override func iterative_forVertex(_ v: VertexType) -> Void {
        
        var visited_set = Set<VertexType>()
        

        
        let l0 = Level(index: 0)
        l0.queue.enqueue(v)
        var depth = 0
        
        
        level_.append(l0)
        
        var queue = XALG_DS_Queue__Array<VertexType>()
        
        queue.enqueue(v)
        
        while true {
            
            depth += 1
            
            var subqueue = XALG_DS_Queue__Array<VertexType>()
            
            
            for u in queue.internalArray {
                visited_set.insert(u)
            } ////// do not merge with below loop.
            
            for u in queue.internalArray {
                for v1 in graph!.adjecentVertex_(for: u) {
                    if !visited_set.contains(v1) {
                        if !subqueue.internalArray.contains(v1) {
                            subqueue.enqueue(v1)
                        }
                    }
                }
                
            }
            
            if subqueue.isEmpty { return }
            
            print(subqueue.internalArray.map { $0.identifier })
            
            queue = subqueue
            
            let l = Level(index: depth)
            l.queue = subqueue
            
            level_.append(l)
            
//            depth += 1
            
        }
    
    }
    
}
