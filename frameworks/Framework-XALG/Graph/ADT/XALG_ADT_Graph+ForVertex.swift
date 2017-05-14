//
//  XALG_ADT_Graph+ForVertex.swift
//  XALG
//
//  Created by Juguang Xiao on 26/03/2017.
//

import Swift
extension XALG_ADT_Graph

//where VertexType == EdgeType.VertexType

{
    func edges(forVertex v: VertexType, edgeKind : XALG_Enum_Graph_EdgeKindForVertex) -> [EdgeType] {
        
        let vv = v as! EdgeType.VertexType
        switch edgeKind {
        case .inEdge: return inEdges(forVertex: v)
        case .outEdge : return outEdges(forVertex: v)
        case .undirected :
            return edge_.flatMap{
                let c = $0.vertex_.contains(vv)
                return c ? $0 : nil
            }
        }
    }
    

    func inEdges(forVertex v : VertexType) -> [EdgeType] {
        return edge_.filter {
            let v1 = $0.vertex_[1] as! VertexType
            return v1 == v
        }
    }
    
    // performance is O(E)
    func outEdges(forVertex v : VertexType) -> [EdgeType] {
        return edge_.filter {
            let v1 = $0.vertex_[0] as! VertexType
            return v1 == v
        }
    }
    
    
    func adjecentVertex_(for v: VertexType) -> [VertexType] {
        
        return adjecentVertexEdgeTuple_(forVertex: v).map { return $0.0 }
        
//        return []
    }
    
    
    
    func adjecentVertexEdgeTuple__out(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        
        
        return outEdges(forVertex: v).map { ($0.vertex_[1] as! VertexType, $0) }
    }
    
    func adjecentVertexEdgeTuple__in(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        let a_ : [(VertexType, EdgeType)] = inEdges(forVertex: v).map { ($0.vertex_[0] as! VertexType, $0) }
        return a_
    }
    
    func adjecentVertexEdgeTuple_(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        
        if self.directed {
            return adjecentVertexEdgeTuple__out(forVertex: v)
        }else {
            //            let a_in = adjecentVertexEdgeTuple__in(forVertex: v)
            //            let s_in = Set<(VertexType, EdgeType)>(a_in)
            //            let a_out = adjecentVertexEdgeTuple__out(forVertex: v)
            //            let s_out = Set<(VertexType, EdgeType)>(a_in)
            //            a_in.form
            /// FIXME
            // Fix me.... duplicate
            return adjecentVertexEdgeTuple__in(forVertex: v) + adjecentVertexEdgeTuple__out(forVertex: v)
        }
        
    }
    
}
