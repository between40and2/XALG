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
    
    var vertex_distance_ = Dictionary<VertexType, Int>()
    var vertex_predecessor_ = Dictionary<VertexType, VertexType>()

    override func iterative_forVertex(_ v: VertexType) -> Void {
        
        iterative_2(v)
        
        
    }
    // this works for General BFS, but cannot make depth right. In test example, v3's depth should be 1, not 2.
    private func iterative_1(_ v: VertexType) -> Void {
        var visited_set = Set<VertexType>()
        var queue = XALG_DS_Queue__Array<VertexType>()
        queue.enqueue(v)
        vertex_distance_[v] = 0
        
        while let a = queue.dequeue() {
//            print(queue.internalArray.map { $0.identifier })
            
            if visited_set.contains(a) { continue }
            
            let depth = vertex_distance_[a]!
            handleVertex(a, depth: depth)
      
            //            visited_set.insert(a)
            
            for (v1, _) in graph!.adjecentVertexEdgeTuple_(forVertex: a) {
                if !visited_set.contains(v1) {
                    vertex_distance_[v1] = depth + 1
                    vertex_predecessor_[v1] = a
                    queue.enqueue(v1)
                }
            }
            
            visited_set.insert(a)
        }
    }
    // From the book, introduction to algorithms, 22.2
    enum Color { case white ; case gray ; case black }
    private func iterative_2(_ v: VertexType) -> Void {
        
        
        var vertex_color_ = Dictionary<VertexType , Color>()
        
        
        
        var visited_set = Set<VertexType>()
        var queue = XALG_DS_Queue__Array<VertexType>()
        queue.enqueue(v)
        vertex_distance_[v] = 0
        visited_set.insert(v) // diff from v1
        while let a = queue.dequeue() {
            //            print(queue.internalArray.map { $0.identifier })
            
//            if visited_set.contains(a) { continue } // diff from v1
            
            let depth = vertex_distance_[a]!
            handleVertex(a, depth: depth)
            
            //            visited_set.insert(a)
            
            for (v1, _) in graph!.adjecentVertexEdgeTuple_(forVertex: a) {
                if !visited_set.contains(v1) {
                    vertex_distance_[v1] = depth + 1
                    vertex_predecessor_[v1] = a
                    queue.enqueue(v1)
                    visited_set.insert(v1) // diff from v1
                }
            }
            
            
        }
    }
    
}

