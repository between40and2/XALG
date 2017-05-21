//
//  XALG_Algo_Graph_TopologicalSorting.swift
//  XALG
//
//  Created by Juguang Xiao on 13/04/2017.
//

import Swift


// https://en.wikipedia.org/wiki/Topological_sorting


// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Topological%20Sort/TopologicalSort1.swift

class XALG_Algo_Graph_TopologicalSorting_base<GraphType : XALG_ADT_Graph> : XALG_Algo_Graph_base<GraphType > {
    
    var sorted_ : [VertexType]?
    
}

class XALG_Algo_Graph_TopologicalSorting__DFS<GraphType : XALG_ADT_Graph> : XALG_Algo_Graph_TopologicalSorting_base<GraphType >

{

    typealias VertexType = GraphType.VertexType
    
    var visited_ = Dictionary<GraphType.VertexType , Bool>()
//    var sourceVertex : GraphType.VertexType?
    
    override func run() throws {
        
        guard let g = graph else { throw XALG_Error_Graph_Algo.graphAbsent }
        
        g.vertex_.forEach{
            visited_[$0] = false
        }
        
        let s_ = g.vertex_.filter { return g.inDegree(forVertex: $0) == 0 }
   
        sorted_ = s_.map{recursive_dfs($0)}.reduce([], +).reversed()
        
        
    }
    
    private func recursive_dfs(_ source : VertexType) -> Array<VertexType>{
        
        
        var result = Array<VertexType>()
        result.append(source)
        visited_[source] = true
        
        let edgeKind : XALG_Enum_Graph_EdgeKindForVertex = graph!.directed ? .outEdge : .undirected
        
        let e_ = graph!.edges(forVertex: source, edgeKind: edgeKind)
        for e in e_ {
            let v_another  = e.vertex_[1] as! VertexType
            if let visited = visited_[v_another], !visited  {
                
                result =  self.recursive_dfs(v_another) + result
            }
        }
        
        return result
    }
    
}

class XALG_Algo_Graph_TopologicalSorting__Queue<GraphType : XALG_ADT_Graph> : XALG_Algo_Graph_TopologicalSorting_base<GraphType > {
    

    typealias VertexType = GraphType.VertexType
    
    override func run() throws {
        sorted_  = Array<VertexType>()
        
        guard let g = graph else { throw XALG_Error_Graph_Algo.graphAbsent }
        
        var vertex_indegree_ : [AnyHashable : Int] = [:]
        for v in g.vertex_ {
            
            let ind = g.inDegree(forVertex: v)
            print(v.identifier, ind)
            vertex_indegree_[v] = ind // g.inDegree(forVertex: v)
        }
        
        var vertex_visited_ : [AnyHashable : Bool ] = [:]
        

        var queue = XALG_DS_Queue__Array<VertexType>()
        
        for v in g.vertex_ {
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
    
    
    
}
