//  XALG_Hosting_GraphEdge.swift, in XALGTests, on 2020/12/23.

//import Foundation
protocol XALG_Hosting_GraphEdge {
    associatedtype VertexType : XALG_ADT_Vertex
    associatedtype EdgeType : XALG_ADT_Edge
    var edge_  : [EdgeType] { get }
    
    func edge_(on v : VertexType) -> [EdgeType]
}


extension XALG_Hosting_GraphEdge

//where VertexType == EdgeType.VertexType

{
    func edges(forVertex v: VertexType, edgeKind : XALG_Enum_Graph_EdgeKindForVertex) -> [EdgeType] {
        
        let vv = v as! EdgeType.VertexType
        switch edgeKind {
        case .inEdge: return inEdges(forVertex: v)
        case .outEdge : return outEdges(forVertex: v)
        case .undirected :
            // flatMap' is deprecated: Please use compactMap(_:) for the case where closure returns an optional value
            return edge_.compactMap{
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
    
    func adjecentVertexEdgeTuple__out(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        
        
        return outEdges(forVertex: v).map { ($0.vertex_[1] as! VertexType, $0) }
    }
    
    func adjecentVertexEdgeTuple__in(forVertex v: VertexType) -> [(VertexType, EdgeType)] {
        let a_ : [(VertexType, EdgeType)] = inEdges(forVertex: v).map { ($0.vertex_[0] as! VertexType, $0) }
        return a_
    }
    
    
}




extension XALG_Hosting_GraphEdge
//where VertexType == EdgeType.VertexType

{ // query only; read-only
        func edge(from v0 : VertexType, to  v1 : VertexType) -> EdgeType? {
        
        for e in edge_ {
            let vv0 = e.vertex_[0] as! VertexType
            let vv1 = e.vertex_[1] as! VertexType
            if vv0 == v0 && vv1 == v1 {
                return e
            }
        }
        
        return nil
    }
    
    ////////////
    func outEdgesAndVertices(forVertex v : VertexType) -> [(EdgeType, VertexType)] {
        let e_ = outEdges(forVertex: v)
        
        return e_.map { (e) -> (EdgeType, VertexType) in
            let v1 = e.vertex_[1] as! VertexType
            return (e, v1)
        }
        
    }
    
    func inDegree(forVertex v : VertexType) -> Int {
        return inEdges(forVertex: v).count
    }
    
    func outDegree(forVertex v : VertexType) -> Int {
        return outEdges(forVertex: v).count
    }
}
