//
//  XALG_ADT_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 10/12/15 (originally).
//

import Swift
protocol XALG_ADT_Graph: class, XALG_Hosting_GraphEdge , XALG_Hosting_GraphVertex , XALG_Building_GraphEdge_undirectional, XALG_Building_GraphEdge_directional{
//    associatedtype VertexIdentifierType : Hashable
//    associatedtype VertexType : XALG_ADT_Vertex
//    associatedtype EdgeType : XALG_ADT_Edge
    
    init(directed: Bool) // Default argument not permitted in a protocol initializer
    //    var vertexList : [VertexType] { get set }
    
    func adjecentVertexEdgeTuple_(forVertex v : VertexType) -> [(VertexType, EdgeType)]
    
    var directed : Bool { get }
    
//    var vertex_ : [VertexType] { get }
//    var edge_  : [EdgeType] { get }
    
//    func vertex(identifier ident : VertexIdentifierType )  -> VertexType?
    
    // Mutating
    
    // what is the purpose of adding an island vertex?
//    func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType
    
//    func addEdge(between v0 : VertexType, and v1 : VertexType) throws -> EdgeType?
    
}

protocol XALG_Hosting_GraphVertex {
    associatedtype VertexIdentifierType : Hashable
    associatedtype VertexType : XALG_ADT_Vertex
    var vertex_ : [VertexType] { get }
    func vertex(identifier ident : VertexIdentifierType )  -> VertexType?
    func addVertex(identifier ident: VertexIdentifierType) throws -> VertexType
}



protocol XALG_Building_GraphEdge_base {
    associatedtype VertexType : XALG_ADT_Vertex
    associatedtype EdgeType : XALG_ADT_Edge
}

protocol XALG_Building_GraphEdge_undirectional : XALG_Building_GraphEdge_base {
    func addEdge(between v0 : VertexType, and v1 : VertexType) throws -> EdgeType?
}

protocol XALG_Building_GraphEdge_directional {
    associatedtype VertexType : XALG_ADT_Vertex
    associatedtype EdgeType : XALG_ADT_Edge
    func addEdge(from v0 : VertexType, to v1 : VertexType) throws -> EdgeType?
}

