//
//  XALG_Algo_Graph_TopologicalSorting.swift
//  XALG
//
//  Created by Juguang Xiao on 13/04/2017.
//

import Swift


// https://en.wikipedia.org/wiki/Topological_sorting


// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Topological%20Sort/TopologicalSort1.swift

class XALG_Algo_Graph_TopologicalSorting__DFS<GraphType : XALG_ADT_Graph> : XALG_Algo_Graph_base<GraphType >

{

    typealias VertexType = GraphType.VertexType
    
    var visited_ = Dictionary<GraphType.VertexType , Bool>()
//    var sourceVertex : GraphType.VertexType?
    
    override func run() throws {
        
        fatalError("Under Construction")
        
//        let s_ = graph!.vertex_.filter { return graph!.inDegree(forVertex: $0) == 0 }
//        
//        
//        s_.forEach {
//            
//            recursive_dfs($0)
//        }
        
    }
    
    private func recursive_dfs(_ source : VertexType) -> Array<VertexType>{
        
        var result = Array<VertexType>()
        
        let edgeKind : XALG_Enum_Graph_EdgeKindForVertex = graph!.directed ? .outEdge : .undirected
        
        for e in graph!.edges(forVertex: source, edgeKind: edgeKind) {
            if let visited = visited_[source], !visited  {
                let v_another  = e.vertex_[1] as! VertexType
                result = self.recursive_dfs(v_another) + result
            }
        }
        
        visited_[source] = true
        
        return result
    }
    
}

class XALG_Algo_Graph_TopologicalSorting__Queue<GraphType : XALG_ADT_Graph> : XALG_Algo_Graph_base<GraphType > {
    
    
    typealias VertexType = GraphType.VertexType
    
    
    override func run() throws {
        sorted_  = Array<VertexType>()
        
        let g = graph!
        
        var vertex_indegree_ : [AnyHashable : Int] = [:]
        for v in g.vertex_ {
            
            let ind = g.inDegree(forVertex: v)
            print(v.identifier, ind)
            vertex_indegree_[v] = ind // g.inDegree(forVertex: v)
            
            
        }
        
        var vertex_visited_ : [AnyHashable : Bool ] = [:]
        

        var queue = XALG_DS_Queue__Array<VertexType>()
        
        for v in graph!.vertex_ {
            if g.inDegree(forVertex: v) == 0 {
                queue.enqueue(v)
 
                
            }
        }
        
        while let u = queue.dequeue() {
            
            vertex_visited_[u] = true
            
            visit(u)
            
            for v in g.adjecentVertex_(for: u) {
                
                var ind = vertex_indegree_[v]!
                ind -= 1
                vertex_indegree_[v] = ind
                if ind == 0 {
                    queue.enqueue(v)
                }
            }
            
        }
        
    }
    
    
    func visit(_ v : VertexType) {
        
        sorted_!.append(v)
    }
    
    var sorted_ : [VertexType]?
    
}
