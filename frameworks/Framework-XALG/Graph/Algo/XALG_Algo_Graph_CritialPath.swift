//
//  XALG_Algo_Graph_CritialPath.swift
//  XALG
//
//  Created by Juguang Xiao on 18/04/2017.
//

import Swift

// http://2d.hep.cn/1871820/18
class XALG_Algo_Graph_CritialPath <G >: XALG_Algo_Graph_base<G>
where G : XALG_ADT_Graph_Weighted
{

    typealias WeightType = G.WeightType
    typealias VertexType_Concrete =  XALG_DS_GraphVertex<G.VertexIdentifierType>
    
    typealias EdgeType_Concrete = XALG_DS_GraphEdge_Weight<VertexType_Concrete, WeightType>
    
    var v_e_ = Dictionary<VertexType_Concrete , WeightType>()
    var v_l_ = Dictionary<VertexType_Concrete , WeightType>()
    
    override func run() throws {
        guard let g = graph as? XALG_Rep_Graph_Weighted<G.VertexIdentifierType, G.WeightType> else { throw XALG_Error_Graph_Algo.graphAbsent }
    

        
        v_e_ = Dictionary<VertexType_Concrete , WeightType>()
        var v_indgree_ = Dictionary<VertexType_Concrete , Int>()
        
        for v in g.vertex_ {
            v_indgree_[v] = g.inDegree(forVertex: v)
            v_e_[v] = G.WeightType.zero
        }
        
        var queue = XALG_DS_Queue__Array<VertexType_Concrete>()
        
        g.vertex_.forEach{
            let v = $0 
            let ind = g.inDegree(forVertex: $0)
            v_indgree_[v] = ind
            if ind == 0 {
                queue.enqueue(v)
            }
            
        }
 
        var stack = XALG_DS_Stack__Array<VertexType_Concrete>()

        
//        let indegree_ = g.vertex_.map{
//            v_e_[$0] = 0.0
//            return graph!.inDegree(forVertex: $0 )
//        }
        var count = 0
        while let v = queue.dequeue(){
            let vv = v 
            stack.push(v)
            count += 1
            for (e, v1) in g.outEdgesAndVertices(forVertex: vv)  {
                let ee = e as!   EdgeType_Concrete ///XALG_Rep_Edge_Weight<G.VertexType, WeightType>
                var ind = v_indgree_[v1]!
                ind -= 1
                v_indgree_[v1] = ind
                if v_indgree_[v1] == 0 {
                    queue.enqueue(v1)
                }
                let weight = g.weight(onEdge: ee)
                let w_0 = v_e_[vv]!
                let s = w_0 + weight
                let t = v_e_[v1]!
                if s > t {
                    v_e_[v1] = s
                }
                
            }
        }
        
        
        
        if count < g.vertex_.count {
            // got cycle!!!
            
            throw XALG_Error_Graph.hasCycle
        }
        /////
        
        v_l_ = Dictionary<VertexType_Concrete , WeightType>()
        
        // by now, stack is full, same as all vertices. 
        let v = stack.top()!
        g.vertex_.forEach {
            v_l_[$0] = v_e_[v]
        }
        
        while let v = stack.pop() {
            for (e, v1) in g.outEdgesAndVertices(forVertex: v) {
                let e_w = e as! EdgeType_Concrete
                let weight = g.weight(onEdge:  e_w)
                let alt = v_l_[v1]! - weight
                if  alt < v_l_[v]! {
                    v_l_[v] = alt
                }
            }
        }
        
        
        ////////////////
        
        var early : WeightType!
        var late : WeightType!
        
        path_  = Array<Graph_Path>()
        var pathEdge_  =  [EdgeType_Concrete]()
        for v in g.vertex_ {
            
            
            
            for (e, v1) in g.outEdgesAndVertices(forVertex: v) {
                let e_w = e as! EdgeType_Concrete
                let weight = g.weight(onEdge:  e_w)
             
                early = v_e_[v]!
                late = v_l_[v1]! - weight
                if early == late {
                    
                    let e_inCP = g.edge(from: v, to: v1)! as! EdgeType_Concrete
                    
                    pathEdge_.append(e_inCP)
                    
                    print(" <", v.identifier, ", ", v1.identifier)
                }
            }
            
            
        }
    
        if pathEdge_.count > 0 {
            let p = Graph_Path(edge_: pathEdge_)
            path_.append( p)
        }
    }
    
    private(set) var path_ : Array<Graph_Path> = Array<Graph_Path>()
    
    
    struct Graph_Path  {
        var edge_ : [EdgeType_Concrete]
    }
    
}
